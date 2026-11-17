# Revisão para concursos – DPESP 2027 (FCC)
- Usuária: advogada, foco Defensoria. Banca FCC. 20 min/dia de revisão.
- NUNCA reescreva app/index.html sem pedido explícito. Conteúdo novo só em dados/<materia>.json.
- Resumos: tabela public.resumos no Supabase (projeto revisao-dpesp), conteúdo em Markdown; a usuária edita pelo app. Para importar um resumo (Word/PDF), converter para Markdown e inserir com materia/bloco iguais aos dos cards. Nunca sobrescrever um resumo existente sem pedir: ela pode ter editado no app.
- Formato do JSON: {cards:[{tema,frente,verso,origem,errou}], discursivas:[{q,espelho[]}], oral:[{q,followups[],pontos}]}
- Questão errada: 2-3 cards + 1 tema oral. Acertada: 1 card. A cada 10 questões: 1 discursiva no estilo DPE.
- Citar artigo/precedente só quando tiver certeza; se não tiver, marque [verificar].
- Extração do TEC: aba Gabarito + botão "próxima" via JavaScript, sem screenshots. Registrar códigos em processadas.json.
- TickTick, lista "Painel da Vida > Concursos": revisão diária 20 min (recorrente); discursiva em D+3; oral aos sábados; "Próximo bloco: <caderno>".
