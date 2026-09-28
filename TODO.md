# ppy.nvim — TODO

> Port fiel do tema ppy (Dean Herbert, JetBrains) para Neovim.

## Paleta
- [x] Cores de sintaxe extraídas de `ppy Dark.xml` / `ppy Light.xml` sem alterações.
- [x] UI a partir do "Dark Purple" (`ppy Dark.theme.json`) e das variáveis `$base*` do tema light.
- [x] Relatório de contraste (`scripts/contrast.lua`) — informativo, as cores originais são mantidas.

## Core
- [x] `colors/ppy.lua` (segue `background`), `ppy-light.lua`, `ppy-dark.lua`.
- [x] Compilação para bytecode em cache, chaveado por hash da config + versão.
- [x] `:PpyCompile` / `:PpyClearCache` / `:PpyExtras`.

## Assinaturas do ppy
- [x] Keywords rosa, tipos azuis, funções verdes, strings amarelas, números magenta.
- [x] Tipos builtin e booleanos como keywords.
- [x] Bloco roxo de pré-processador (`#region`, macros, diretivas).
- [x] Bloco laranja em negrito para `TODO`.
- [x] `;` esmaecido via queries `;extends` (c, cpp, c_sharp, java, js, ts, tsx, rust, go, css, scss, php).
- [x] Headers de Markdown azuis com faixa de fundo.
- [x] Erro/aviso com onda + fundo tingido, hint pontilhado lima.
- [x] Semantic tokens: interface, enum, static, readonly, declaração vs chamada, accessor.

## Integrações
- [x] blink.cmp, mini.*, gitsigns, dropbar, grug-far, mason, lazy.nvim, nvim-treesitter
- [x] Statusline nativa (`StMode*`, `StGit*`, `StError`…)

## Extras
- [x] Ghostty, Kitty, Lazygit (light/dark)

## Qualidade
- [x] Teste headless (variantes, cores exatas, query de `;`, cache, opções).
- [x] Benchmark de carregamento.
