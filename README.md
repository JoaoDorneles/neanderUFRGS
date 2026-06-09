# Neander Completo com Memória
**Disciplina:** INF01058 - Circuitos Digitais — UFRGS  
 
---
 
## Sobre o Projeto
 
Este projeto consiste na implementação em Verilog (Quartus) do processador hipotético **Neander**, um processador simplificado amplamente utilizado no ensino de Circuitos Digitais e Arquitetura de Computadores.
 
O objetivo principal não é apenas fazer o hardware funcionar, mas **entender o que cada linha de código representa fisicamente** — por isso, sempre que possível, optamos pela descrição **estrutural** em vez da comportamental, tornando explícito quais portas lógicas, flip-flops e conexões estão sendo sintetizados.
 
---
 
## O que aprendemos e aplicamos
 
**Descrição estrutural de hardware em Verilog**  
Instanciar módulos manualmente (flip-flops, half-adders, muxes) em vez de usar `always @` comportamental, tornando o hardware descrito visível e compreensível.
 
**Hierarquia de módulos**  
Construir componentes complexos a partir de blocos simples reutilizáveis — o mesmo `ffd.v` (flip-flop D) é base para AC, REM, RDM, RI e NZ.
 
**Unidade Lógica e Aritmética (ULA)**  
Projeto de uma ULA de 8 bits com 5 operações (ADD, AND, OR, NOT, PassThrough), selecionadas por uma árvore de multiplexadores controlada por `selULA[2:0]`, com geração das flags N e Z.
 
**Registradores e suas particularidades**  
Diferença entre um registrador simples (AC, REM, RDM, RI, NZ) e um registrador contador (PC), que além de armazenar um valor também incrementa automaticamente usando uma cadeia de half-adders.
 
**Codificação e decodificação de instruções**  
Separação de responsabilidades entre o decodificador (opcode → sinais booleanos por instrução) e o codificador da ULA (sinais booleanos → `selULA[2:0]`), e como esses dois domínios se comunicam através da Unidade de Controle.
 
**Unidade de Controle hardcoded**  
Implementação do controle através de expressões lógicas combinacionais, onde cada sinal de controle (`cargaPC`, `cargaREM`, `cargaAC`...) é função do tempo (`t0..t7`) e da instrução em execução — sem uso explícito de FSM.
 
**Temporizador**  
Contador de 3 bits com decodificador acoplado, gerando os sinais `t0..t7` que cadenciam os micropassos de cada instrução.
 
**Integração com memória e FPGA**  
Conexão do processador com uma memória ROM/RAM e mapeamento do circuito completo para uma FPGA (EP3C16F484C6), com visualização do PC e AC em displays de 7 segmentos e modos run/debug controlados por switches e botões.
 
---
 
## Componentes implementados
 
| Módulo | Descrição |
|--------|-----------|
| `fa.v` / `ha.v` | Full Adder e Half Adder |
| `RCA8.v` | Somador Ripple Carry de 8 bits |
| `incrementaPC.v` | Incrementador de 8 bits (cadeia de HAs) |
| `mux21.v` | Multiplexador 2:1 de 8 bits |
| `ULA.v` | Unidade Lógica e Aritmética de 8 bits |
| `codificadorULA.v` | Codificador das operações da ULA |
| `decodificadorNeander.v` | Decodificador de opcodes |
| `ffd.v` | Flip-flop D com reset assíncrono e enable |
| `AC.v` | Registrador Acumulador (8 bits) |
| `REM.v` | Registrador de Endereço de Memória (8 bits) |
| `RDM.v` | Registrador de Dados de Memória (8 bits) |
| `RI.v` | Registrador de Instrução (8 bits, opcode em [7:4]) |
| `PC.v` | Program Counter — registrador contador (8 bits) |
| `NZ.v` | Registrador de flags Negativo e Zero |
