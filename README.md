# Revisão DPESP

- `app/index.html` — o app (abas por matéria; objetiva com repetição espaçada, discursiva com espelho, oral com aprofundamento).
- `dados/*.json` — conteúdo. **Ao criar um arquivo novo, adicione o nome em `dados/index.json`** (o GitHub Pages não lista pastas). Arquivos com o mesmo `"materia"` são agrupados na mesma aba.
- `supabase.sql` — tabelas `progresso` e `resumos`, com RLS.

## Resumos
Ficam na tabela `resumos` do Supabase (não em `dados/`), em Markdown, e são editados pela aba **📖 RESUMOS** do app (exige login). Campos: `materia` (igual ao nome da aba), `bloco` (ex.: "Constitucional 02"), `titulo`, `conteudo`, `ordem`. Quando o `bloco` do resumo é igual ao `origem` de um card, o card mostra o botão "Ver resumo do bloco".

## Supabase
1. Rode `supabase.sql` no SQL Editor.
2. Authentication → URL Configuration: adicione a URL do GitHub Pages (ex.: `https://SEU-USUARIO.github.io/REPO/app/`) em Redirect URLs.
3. Preencha `app/config.js` com a Project URL e a chave anon/publishable.

## GitHub Pages
Suba a pasta inteira para um repositório → Settings → Pages → Deploy from branch `main`, pasta `/ (root)`. Acesse `/app/`.

## Formato do JSON
```json
{ "materia": "Direito Constitucional", "bloco": "Constitucional 02",
  "cards":      [{"id":"c02-o01","tema":"...","frente":"...","verso":"...","origem":"Constitucional 02","errou":false}],
  "discursivas":[{"id":"c02-d1","q":"...","espelho":["..."]}],
  "oral":       [{"id":"c02-r1","q":"...","followups":["..."],"pontos":"..."}] }
```
O `id` é opcional, mas recomendado: o progresso fica atrelado a ele. Sem `id`, o app usa a posição no arquivo — então só acrescente itens no fim, nunca reordene.
