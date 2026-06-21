module unidadeDeControle(
    input t0, t1, t2, t3, t4, t5, t6, t7, flagZ, flagN,
    input NOP, STA, LDA, ADD, OR, AND, NOT, JMP, JZ, JN, HLT,
    
    output cargaREM, cargaAC, cargaNZ, cargaPC, goto_t0, incrementaPC, cargaRI, sel, cargaRDM, read, write,
    output ULA_y, ULA_add, ULA_and, ULA_or, ULA_not
    
);
    assign cargaREM = t0 | (t3 & (STA | LDA | ADD | OR | AND | JMP | (JN & flagN) | (JZ & flagZ))) | (t5 & (STA | LDA | ADD | OR | AND));

    assign incrementaPC = t1 | (t4 & (STA | LDA | ADD | OR | AND)) | (t3 & ((JN & ~flagN) | (JZ & ~flagZ)));

    assign cargaRI = t2;

    assign sel = t5 & (STA | LDA | ADD | OR | AND);

    assign cargaRDM = t6 & STA;

    assign read = t1 | (t4 & (STA | LDA | ADD | OR | AND | JMP | (JN & flagN) | (JZ & flagZ))) | (t6 & (LDA | ADD | OR | AND));

    assign write = t7 & STA;

    assign ULA_y = t7 & LDA;

    assign ULA_add = t7 & ADD;

    assign ULA_or = t7 & OR;

    assign ULA_and = t7 & AND;

    assign ULA_not = t3 & NOT;

    assign cargaAC = (t7 & (LDA | ADD | OR | AND)) | (t3 & NOT);

    assign cargaNZ = cargaAC; 

    assign cargaPC = t5 & (JMP | (JN & flagN) | (JZ & flagZ));

    assign goto_t0 = (t7 & (STA | LDA | ADD | OR | AND)) | (t3 & (NOP | NOT | (JN & ~flagN) | (JZ & ~flagZ))) | (t5 & (JMP | (JN & flagN) | (JZ & flagZ)));

endmodule
