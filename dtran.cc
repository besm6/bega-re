/*
 * A disassembler for the BESM-6 executable binaries produced by
 * Pascal-Autocode.
 *
 * To produce pseudo-code that can be given to the "decompiler":
 * dtran -d pascompl.o > pascompl.out
 *
 * Copyright 2019 Leonid Broukhis
 */

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <sys/stat.h>
#include "unistd.h"

/*
 * BESM-6 opcode types.
 */
typedef enum {
OPCODE_ILLEGAL,
OPCODE_STR1,		/* short addr */
OPCODE_STR2,		/* long addr */
OPCODE_IMM,		/* e.g. NTR */
OPCODE_REG1,		/* e.g. ATI */
OPCODE_JUMP,		/* UJ */
OPCODE_BRANCH,		/* UZA, U1A, VZM, V1M, VLM */
OPCODE_CALL,		/* VJM */
OPCODE_IMM64,		/* e.g. ASN */
OPCODE_ADDRMOD,		/* UTC, WTC */
OPCODE_REG2,		/* VTM, UTM */
OPCODE_IMMEX,		/* *50, ... */
OPCODE_ADDREX,		/* *64, *70, ... */
OPCODE_STOP,		/* *74 */
OPCODE_DEFAULT
} opcode_e;

struct opcode {
	const char *name;
	uint opcode;
	uint mask;
	opcode_e type;
} op[] = {
  /* name,	pattern,  mask,	    opcode type */
  { "ATX",	0x000000, 0x0bf000, OPCODE_STR1 },
  { "STX",	0x001000, 0x0bf000, OPCODE_STR1 },
  { "XTS",	0x003000, 0x0bf000, OPCODE_STR1 },
  { "A+X",	0x004000, 0x0bf000, OPCODE_STR1 },
  { "A-X",	0x005000, 0x0bf000, OPCODE_STR1 },
  { "X-A",	0x006000, 0x0bf000, OPCODE_STR1 },
  { "AMX",	0x007000, 0x0bf000, OPCODE_STR1 },
  { "XTA",	0x008000, 0x0bf000, OPCODE_STR1 },
  { "AAX",	0x009000, 0x0bf000, OPCODE_STR1 },
  { "AEX",	0x00a000, 0x0bf000, OPCODE_STR1 },
  { "ARX",	0x00b000, 0x0bf000, OPCODE_STR1 },
  { "AVX",	0x00c000, 0x0bf000, OPCODE_STR1 },
  { "AOX",	0x00d000, 0x0bf000, OPCODE_STR1 },
  { "A/X",	0x00e000, 0x0bf000, OPCODE_STR1 },
  { "A*X",	0x00f000, 0x0bf000, OPCODE_STR1 },
  { "APX",	0x010000, 0x0bf000, OPCODE_STR1 },
  { "AUX",	0x011000, 0x0bf000, OPCODE_STR1 },
  { "ACX",	0x012000, 0x0bf000, OPCODE_STR1 },
  { "ANX",	0x013000, 0x0bf000, OPCODE_STR1 },
  { "E+X",	0x014000, 0x0bf000, OPCODE_STR1 },
  { "E-X",	0x015000, 0x0bf000, OPCODE_STR1 },
  { "ASX",	0x016000, 0x0bf000, OPCODE_STR1 },
  { "XTR",	0x017000, 0x0bf000, OPCODE_STR1 },
  { "RTE",	0x018000, 0x0bf000, OPCODE_IMM },
  { "YTA",	0x019000, 0x0bf000, OPCODE_IMM },
  { "E+N",	0x01c000, 0x0bf000, OPCODE_IMM64 },
  { "E-N",	0x01d000, 0x0bf000, OPCODE_IMM64 },
  { "ASN",	0x01e000, 0x0bf000, OPCODE_IMM64 },
  { "NTR",	0x01f000, 0x0bf000, OPCODE_IMM },
  { "ATI",	0x020000, 0x0bf000, OPCODE_REG1 },
  { "STI",	0x021000, 0x0bf000, OPCODE_REG1 },
  { "ITA",	0x022000, 0x0bf000, OPCODE_REG1 },
  { "ITS",	0x023000, 0x0bf000, OPCODE_REG1 },
  { "MTJ",	0x024000, 0x0bf000, OPCODE_REG1 },
  { "M+J",	0x025000, 0x0bf000, OPCODE_REG1 },
  { "*50",	0x028000, 0x0bf000, OPCODE_IMMEX },
  { "*51",	0x029000, 0x0bf000, OPCODE_IMMEX },
  { "*52",	0x02a000, 0x0bf000, OPCODE_IMMEX },
  { "*53",	0x02b000, 0x0bf000, OPCODE_IMMEX },
  { "*54",	0x02c000, 0x0bf000, OPCODE_IMMEX },
  { "*55",	0x02d000, 0x0bf000, OPCODE_IMMEX },
  { "*56",	0x02e000, 0x0bf000, OPCODE_IMMEX },
  { "*57",	0x02f000, 0x0bf000, OPCODE_IMMEX },
  { "*60",	0x030000, 0x0bf000, OPCODE_ADDREX },
  { "*61",	0x031000, 0x0bf000, OPCODE_ADDREX },
  { "*62",	0x032000, 0x0bf000, OPCODE_IMMEX },
  { "*63",	0x033000, 0x0bf000, OPCODE_IMMEX },
  { "*64",	0x034000, 0x0bf000, OPCODE_ADDREX },
  { "*65",	0x035000, 0x0bf000, OPCODE_IMMEX },
  { "*66",	0x036000, 0x0bf000, OPCODE_IMMEX },
  { "*67",	0x037000, 0x0bf000, OPCODE_ADDREX },
  { "*70",	0x038000, 0x0bf000, OPCODE_ADDREX },
  { "*71",	0x039000, 0x0bf000, OPCODE_ADDREX },
  { "*72",	0x03a000, 0x0bf000, OPCODE_ADDREX },
  { "*73",	0x03b000, 0x0bf000, OPCODE_ADDREX },
  { "*74",	0x03c000, 0x0bf000, OPCODE_STOP },
  { "CTX",	0x03d000, 0x0bf000, OPCODE_ADDREX },
  { "*76",	0x03e000, 0x0bf000, OPCODE_IMMEX },
  { "*77",	0x03f000, 0x0bf000, OPCODE_IMMEX },
  { "UTC",	0x090000, 0x0f8000, OPCODE_ADDRMOD },
  { "WTC",	0x098000, 0x0f8000, OPCODE_ADDRMOD },
  { "VTM",	0x0a0000, 0x0f8000, OPCODE_REG2 },
  { "UTM",	0x0a8000, 0x0f8000, OPCODE_REG2 },
  { "UZA",	0x0b0000, 0x0f8000, OPCODE_BRANCH },
  { "U1A",	0x0b8000, 0x0f8000, OPCODE_BRANCH },
  { "UJ",	0x0c0000, 0x0f8000, OPCODE_JUMP },
  { "VJM",	0x0c8000, 0x0f8000, OPCODE_CALL },
  { "VZM",	0x0e0000, 0x0f8000, OPCODE_BRANCH },
  { "V1M",	0x0e8000, 0x0f8000, OPCODE_BRANCH },
  { "VLM",	0x0f8000, 0x0f8000, OPCODE_BRANCH },
/* This entry MUST be last; it is a "catch-all" entry that will match when no
 * other opcode entry matches during disassembly.
 */
  { "",		0x0000, 0x0000, OPCODE_ILLEGAL },
};

typedef unsigned long long uint64;
typedef unsigned int uint32;


typedef unsigned int uint;

std::string strprintf(const char * fmt, ...) {
    std::string ret;
    char * str;
    va_list ap;
    va_start (ap, fmt);
    vasprintf(&str, fmt, ap);
    va_end(ap);
    ret = str;
    free(str);
    return ret;
}

static const char * gost_to_utf[] = {
    "0", "1", "2", "3", "4", "5", "6", "7",
    "8", "9", "+", "-", "/", ",", ".", " ",
    "⏨", "↑", "(", ")", "×", "=", ";", "[",
    "]", "*", "`", "'", "#", "<", ">", ":",
    "А", "Б", "В", "Г", "Д", "Е", "Ж", "З",
    "И", "Й", "К", "Л", "М", "Н", "О", "П",
    "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч",
    "Ш", "Щ", "Ы", "Ь", "Э", "Ю", "Я", "D",
    "F", "G", "I", "J", "L", "N", "Q", "R",
    "S", "U", "V", "W", "Z", "^", "≤", "≥",
    "∨", "&", "⊃", "~", "÷", "≡", "%", "$",
    "|", "—", "_", "!", "\"", "Ъ", "?", "′"
};

FILE * entries;

std::set<int> gostoff;
int forced_code_off;
struct Dtran {
    uint head_len;
    uint total_len;
    uint main_off;
    uint code_off;
    uint basereg, baseaddr, baseop;
    bool nolabels, nooctal, nodlabels;

    bool code_map[32768];
    
    void fill_lengths() {
        head_len = 0;           // the binary is read to address 0
        total_len = memory[5] & 077777;
//        labels.resize(total_len);
        main_off = memory[010] & 077777;
        mklabel(main_off);
        std::fill(code_map, code_map+32768, false);
        code_off = find_code_offset();
        printf(" %s:,NAME, NEW DTRAN\n",
               get_gost_word(memory[1]).c_str());
        printf("C Memory size: %o\n", total_len);
        printf("C Code start: %o\n", code_off);
        printf("C Program start: %o\n", main_off);
        if (nolabels) {
            printf(" /:,BSS,\n");
        }
    }

    uint64 memory[32768];

/*
 * Read a 48-bit word at the current file position.
 */
uint64
freadw (FILE *fd)
{
    uint64 val = 0;
    int i;
    for (i = 0; i < 6; ++i) {
        val <<= 8;
        val |= getc (fd);
    }
    return val;
}

    uint mklabel(uint off) {
        labels[off] = strprintf("L%04o", off) ;
    }

uint find_code_offset() {
    uint min_addr = total_len;

    std::vector<uint> todo;
    todo.push_back(main_off);
    if (entries) {
        int off;
        while(1 == fscanf(entries, "%i", &off)) {
            todo.push_back(off);
            mklabel(off);
        }
        fprintf(stderr, "Got %lu known entry points\n", todo.size());
    }
    
    // Looking for all opcodes '16 31 XXXXX' and finding the lowest
    // by transitive closure, ignoring '16 31 00000' as an indirect call.
    while (!todo.empty()) {
        uint cur = todo.back();
        todo.pop_back();
        if (code_map[cur]) continue;
        if (cur >= total_len) continue;
        
        code_map[cur] = true;
        if (cur < min_addr) min_addr = cur;
        uint64 word = memory[cur];
        uint insn[2];
        insn[0] = word >> 24;
        insn[1] = word & 0xFFFFFF;
        for (uint i = 0; i < 2; ++i) {
            uint cinsn = insn[i];
            uint next_addr;
            uint opcode = (cinsn & 037) >> 15;
            if (opcode == 031 || opcode == 034 || opcode == 035) { // VJM, VZM, V1M, any reg
                next_addr = cinsn & 077777;
                if (next_addr && next_addr < total_len) {
                    mklabel(next_addr);
                    todo.push_back(next_addr);
                }
                todo.push_back(cur+1);
                break;
            } else if (opcode == 030) { // UJ
                next_addr = cinsn & 077777;
                if (next_addr < total_len && (cinsn >> 20) == 0) {
                    todo.push_back(next_addr);
                    mklabel(next_addr);
                } else if ((next_addr == cur || next_addr == cur+1) && (cinsn >> 20) != 0) {
                    // This looks like a jump table.
                    for(uint t = next_addr; t < total_len; ++t) {
                        uint64_t entry = memory[t];
                        if ((entry >> (24+15)) == 030) { // A jump
                            todo.push_back(t);
                        } else
                            break;
                    }
                }
                break;
            } else if ((cinsn & 077600000) == 002600000 // U1A, UZA, 0 reg
                       || ((cinsn & 077700000) == 042600000)) { // 8,UZA - case stmt by branching with 8 as base
                next_addr = cinsn & 077777;
                if (next_addr < total_len) {
                    todo.push_back(next_addr);
                    mklabel(next_addr);
                }
                if (i == 1) todo.push_back(cur + 1);
            } else if (i == 1)
                todo.push_back(cur + 1);
        }
    }
    return forced_code_off ? forced_code_off : min_addr;
}
    
void
mklabels(uint32 memaddr, uint32 opcode, bool litconst) {
    int arg1 = (opcode & 07777) + (opcode & 0x040000 ? 070000 : 0);
    int arg2 = opcode & 077777;
    int struc = opcode & 02000000;
    uint reg = opcode >> 20;
    uint op = struc ? (opcode >> 15) & 037 : (opcode >> 12) & 077;
    if (!struc && basereg && reg == basereg) {
        reg = 0;
    }
    if (!struc && !reg && arg1 >= 011 && arg1 < total_len && labels[arg1].empty()) {
        labels[arg1] = (litconst && arg1 < code_off) ? get_literal(arg1) :
            strprintf("/%d", arg1);
    } else if (struc && arg2 >= 011 && arg2 < total_len &&
               !(((op == 023) || (op == 025)) && reg != 0)) {
        if (labels[arg2].empty() && code_map[arg2])
            mklabel(arg2);
    }
}

int get_opidx(uint32 opcode) {
    for (int i=0; op[i].mask; i++)
        if ((opcode & op[i].mask) == op[i].opcode)
            return i;
}
  
void
prinsn (uint32 memaddr, uint32 opcode)
{
    int i;

    uint reg = opcode >> 20;
    int arg1 = (opcode & 07777) + (opcode & 0x040000 ? 070000 : 0);
    int arg2 = opcode & 077777;
    int struc = opcode & 02000000;
    int arg = struc ? arg2 : arg1;
    static bool prev_addrmod = false;

    i = get_opidx(opcode);

    opcode_e type = op[i].type;
    std::string opname = op[i].name;
    if (type == OPCODE_ILLEGAL) {
        opname = struc ? strprintf("%2o", (opcode >> 15) & 037)
            : strprintf("%03o", (opcode >> 12) & 0177);
    } else if (!struc && basereg && reg == basereg) {
        reg = 0;
    }
    std::string operand;
    if (arg)
        operand = strprintf(struc ? "U%05o" : "U%04o", struc ? arg2 : arg1);
    if (struc && arg2 >= 074000) {
        std::string & sym = symtab[arg2 & 03777];
        if (sym.empty()) {
            if (type == OPCODE_REG2 || (type == OPCODE_BRANCH && reg != 0))
                operand = strprintf("%d", arg2 - 0100000);
            else
                operand = strprintf("P/%04o", arg2 & 03777);
        } else
            operand = symtab[arg2 & 03777];
    } else if (struc && arg2 && arg2 < labels.size()) {
        uint off = arg2;
        if (labels[off].empty() || type == OPCODE_REG2 || (reg != 0 && type == OPCODE_ADDRMOD))
            operand = strprintf(type == OPCODE_REG2 ? "%oB" : "%d", off);
        else
            operand = labels[off];
    } else if (!struc && arg1 >= 074000) {
        operand = strprintf("C/%04o", arg1 & 03777);
    } else if (uint val = struc ? arg2 : arg1) {
        if (type == OPCODE_REG1 || val < 8 || prev_addrmod)
            operand = strprintf("%d", val);
        else if (type == OPCODE_IMM64) {
            operand = strprintf("64%+d", val-64);
        } else if (!struc && !reg && type != OPCODE_IMMEX &&
                   arg1 >= 011 && arg1 < code_off)
            operand = labels[arg1];
        else
            operand = strprintf(type != OPCODE_IMMEX && nooctal ?
                                "%d" : "%oB", val);
    }


    if (nolabels && operand[0] == 'L' && !strchr(operand.c_str(), '+')) {
        char * end;
        int off = strtol(operand.c_str()+1, &end, 8);
        if (end - operand.c_str() > 4)
            operand = strprintf(nooctal ? "/+%d" : "/+%oB", off);
    }
    if (reg) printf("%d,", reg); else printf(",");
    printf("%s,%s\n", opname.c_str(), operand.c_str());
    prev_addrmod = type == OPCODE_ADDRMOD;
}

std::string get_literal(uint32 addr) {
    uint64 val = memory[addr];
    std::string ret;
    uint64 d = val & 0x7FFFFFFFFFFFull;
    if ((val >> 38) == 01000 && d != 0) {
        if (d > 10000)
            ret = strprintf("DIV%d", (1ull << 40)/(d-1));
        else
            ret = strprintf("mul(%d)", d);
    } else if (is_likely_gost(addr, val)) {
        ret = strprintf("'%s'", get_gost_word(val).c_str());
    } else if (val >= 100 && val <= 10000) {
        ret = strprintf("(%d)", val);
    } else {
        ret = strprintf("(%lloC)", val);
    }
    return ret;
}

    void pr1const(uint cur, bool litconst) {
    uint64 val = memory[cur];
    if (litconst && !nodlabels) {
        printf(" /%d:", cur);                  
    } else if (labels[cur].empty()) {
        printf(" ");
    } else {
        printf(" %s:", labels[cur].c_str());
    }
    if (val < 65536) {
        printf(",INT,%d . 0%o\n", (int)val, (int)val);
    } else if (is_likely_gost(cur, val)) {
        printf(",GOST, |%s| %s\n", get_gost_word(val).c_str(), get_bytes(val).c_str());
    } else {
        printf(",LOG,%llo\n", val);
    }
}

void prconst (bool litconst) {
    for (uint cur = 011; cur < code_off; ++cur) {
        pr1const(cur, litconst);
    }
}

void
prtext (bool litconst)
{
    uint32 addr = code_off;
    uint32 limit = total_len;
    for (uint32 cur = addr; cur < limit; ++cur) {
	if (code_map[cur]) {
        uint64 & opcode = memory[cur];
        mklabels(cur, opcode >> 24, litconst);
        mklabels(cur, opcode & 0xffffff, litconst);
	}
    }
    if (nolabels) {
        puts(" /:,BSS,");
    }
    for (; addr < limit; ++addr) {
        if (!code_map[addr]) { pr1const(addr, litconst); continue; }
        uint64 opcode;
        if (!labels[addr].empty()) {
            if (nolabels) {
                printf(" :");
            } else {
                printf(" %s:", labels[addr].c_str());
            }
        } else
            putchar(' ');
        opcode = memory[addr];
        prinsn (addr, opcode >> 24);
        // Do not print the non-insn part of a word
        // if it looks like a placeholder
        bool addrmod = ((opcode >> 24) & 03600000) == 02200000;
        opcode &= 0xffffff;
        if ((opcode == 0 && !addrmod) || opcode == 02200000) {
            opcode = memory[addr] >> 24;
            opcode &= 03700000;
            if (opcode != 03100000 &&
                labels[addr+1].empty()) {
                labels[addr+1] = " ";
            }
        } else {
            putchar(' ');
            prinsn (addr, opcode);
        }
    }
}

Dtran(const char * fname, uint b, bool n, bool dl, bool o) :
    basereg(b), baseaddr(~0u), nolabels(n), nodlabels(dl), nooctal(o),
    labels(32768)
{

    unsigned int addr = 0;
    struct stat st;

    FILE * textfd = fopen (fname, "r");
    if (! textfd) {
        fprintf (stderr, "dtran: %s not found\n", fname);
        exit(1);
    }
    stat (fname, &st);
    uint codelen = st.st_size / 6;

    if (codelen >= 32768) {
        fprintf(stderr, "File too large\n");
        exit(1);
    }
    while (!feof(textfd) && addr < 0100000) {
        memory[addr++] = freadw (textfd);
    }
    fill_lengths();
    if (codelen < total_len) {
        fprintf(stderr, "File was too short: %d, expected %d\n", codelen, total_len);
        exit (EXIT_FAILURE);
    }
    symtab.resize(04000);
    fclose (textfd);
    uint64 p2[] = {
        00037000300420013LL,
        07444001374440002LL,
        00043001600430001LL,
        05400000263000000LL
    };
    uint64 p3[] = {
        00037000300420013LL,
        07444001374440003LL,
        00043001600430002LL,
        05400000263000000LL
    };
    uint64 p4[] = {
        00037000300420013LL,
        07444001374440004LL,
        00043001600430003LL,
        05400000263000000LL
    };
    uint64 p32[] = {
        05444000314100002LL,
        00040000273000000LL
    };
    uint64 p43[] = {
        05444000420100002LL,
        00040000373000000LL
    };
    label_pattern(p32, sizeof(p32), "P/32");
    label_pattern(p43, sizeof(p43), "P/43");
    label_pattern(p2, sizeof(p2), "P/2");
    label_pattern(p3, sizeof(p3), "P/3");
    label_pattern(p4, sizeof(p4), "P/4");
    labels[012670] = "P/4";
    symtab[012] = "P/E";
    symtab[031] = "P/WOLN";
    symtab[034] = "P/MD";
    symtab[047] = "P/7A";
    symtab[055] = "P/RC";
    symtab[0100] = "P/A7";
    symtab[0101] = "P/WC";
    symtab[0102] = "P/6A";
    symtab[0104] = "P/WI";
    symtab[0110] = "P/IN";
    symtab[0111] = "P/SS";
    symtab[0057] = "P/TR"; // trunc
    symtab[0141] = "P/TR"; // trunc, same as 0057
    symtab[0136] = "P/0060"; // signed mult. correction
    symtab[0222] = "P/0026"; // get(input)
    symtab[0257] = "P/0030"; // put(output)
    symtab[0313] = "P/0032"; // rewrite(output)
    symtab[0337] = "P/0033"; // unpck
    symtab[0173] = "P/0023"; // pck
    symtab[0715] = "P/0040"; // put
    symtab[0760] = "P/0041"; // get
    symtab[0202] = "P/0024"; // intToReal, a no-op in P-M
    symtab[01675] = "P/0066"; // bind
}

void label_pattern(void * pattern, size_t size, std::string name) {
    uint64* where = (uint64*)memmem(memory, sizeof(memory[0])*total_len, pattern, size);
    if (where) labels[where-memory] = name;
}

    std::string get_utf8(uint unic) {
        std::string ret;
        if (unic < 0x80) {
            ret = char(unic);
	} else
	if (unic < 0x800) {
            ret = char(unic >> 6 | 0xc0);
            ret += char((unic & 0x3f) | 0x80);
	} else {
            ret = char(unic >> 12 | 0xe0);
            ret += char(((unic >> 6) & 0x3f) | 0x80);
            ret += char ((unic & 0x3f) | 0x80);
        }
        return ret;
    }

    std::string get_gost_char (unsigned char ch) {
        if (ch < 0140)
            return gost_to_utf[ch];
        else
            return strprintf("_%03o", ch);
    }

#if 0
    std::string get_iso_char (unsigned char ch) {
        ch &= 0177;
        if (ch < 0140) { std::string ret; return ret=ch; }
        return std::string(&"ЮАБЦДЕФГХИЙКЛМНОПЯРСТУЖВЬЫЗШЭЩЧ\177"[2*(ch-0140)], 2);
    }

    std::string get_iso_word(uint64 word) {
        std::string ret;
        for (uint i = 40; i <= 40; i-=8) {
            ret += get_iso_char(word >> i);
        }
        return ret;
    }
#endif

    std::string get_gost_word(uint64 word) {
        std::string ret;
        for (uint i = 40; i <= 40; i-=8) {
            ret += get_gost_char(word >> i);
        }
        return ret;
    }
    std::string get_bytes(uint64 word) {
        std::string ret;
        for (uint i = 40; i <= 40; i-=8) {
            ret += strprintf("%03o ", int(word >> i) & 0377);
        }
        return ret;
    }

#if 0
    bool is_likely_iso (uint64 word) {
        for (uint i = 0; i < 48; i += 8) {
            uint val = (word >> i) & 0377;
            if (val < 040 || val >= 0177)
                return false;
        }
        return true;
    }
#endif

    bool is_likely_gost (uint32 addr, uint64 word) {
	int total = 0, zeros = 0;
        if (gostoff.count(addr))
		return true;
        for (uint i = 0; i < 48; i += 8) {
            uint val = (word >> i) & 0377;
	    // trailing zeros not counted
            if (total && val == 0) ++zeros,++total;
	    if (val) ++total;
            switch (val) {
                case 0377: case 0143: case 0162: case 0172:
		case 0146:
                case 0175: case 0214:
                    break;
		case 020:
			return false;	
                default:
                    if (val >= 0140)
			return false;
                }
        }
        return (word >> 40) || (word >> 32) && total-zeros > 2;
    }
    
    std::vector<std::string> symtab;
    std::vector<std::string> labels;

};

int
main (int argc, char **argv)
{
    int basereg = 0;
    bool nolabels = false, nodlabels = false, nooctal = false, litconst = false;

    const char * usage = "Usage: %s [-l] [-e] [-o] [-c] [-Rbase] [-d] objfile\n";
    char opt;
    FILE * gost;

    while ((opt = getopt(argc, argv, "cdelnoR:E:G:f:")) != -1) {
        switch (opt) {
        case 'l':
            // To produce a compilable assembly code,
            // not needed for decompile.
            nolabels = true;
            break;
        case 'o':
            // If not used, the output will match DTRAN closely,
            // if used, the offsets will always be printed in decimal.
            nooctal = true;
            break;
        case 'n':
            // If set, the /NNNN labels for data will not be printed.
            nodlabels = true;
            break;
        case 'c':
            litconst = true;
            // References to the const section printed as literals;
            // used for decompilation.
            break;
        case 'R':	/* -RN (decimal) use reg N as base */
            // Say -R8 for decompilation
            basereg = 0;
            while (*optarg >= '0' && *optarg <= '9') {
                basereg *= 10;
                basereg += *optarg - '0';
                ++optarg;
            }
            if (basereg == 0 || basereg > 017) {
                fprintf(stderr, "Bad base reg %o, need 1 <= R <= 15\n",
                        basereg);
                exit(1);
            }
            break;
        case 'E':               // A file with a list of entry points
            if ((entries = fopen(optarg, "r")) == NULL) {
                fprintf(stderr, "Bad entry points file %s\n", optarg);
                exit(1);
            }
            break;
	case 'G':		// A file with a list of offsets of GOST literals
	    if ((gost = fopen(optarg, "r")) == NULL) {
                fprintf(stderr, "Bad GOST offsets file %s\n", optarg);
                exit(1);
            }
            break;
		
        case 'd':
            // Decompilation all-in-one mode.
            nooctal = true;
            litconst = true;
            basereg = 8;
            break;
        case 'f':
	    // Forced code offset
	    if (1 != sscanf(optarg, "%i", &forced_code_off)) {
		fprintf(stderr, "Bad forced code offset %s\n", optarg);
		exit(1);
	    }
	    break;
        default: /* '?' */
            fprintf(stderr, usage, argv[0]);
            exit(EXIT_FAILURE);
        }
    }

    if (optind >= argc) {
        fprintf (stderr, usage, argv[0]);
        exit (EXIT_FAILURE);
    }
    if (gost) {
        int off;
        while(1 == fscanf(gost, "%i", &off)) {
            gostoff.insert(off);
        }
        fprintf(stderr, "Got %lu known GOST offsets\n", gostoff.size());
    }
    fprintf(stderr, "Decompiling file %s\n", argv[optind]);
    Dtran dtr(argv[optind], basereg, nolabels, nodlabels, nooctal);
    
    dtr.prconst(litconst);
    dtr.prtext(litconst);
    printf(" ,END,\n");
    return 0;
}
