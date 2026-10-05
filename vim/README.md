# vim config

tema win95 (sei lá, na minha cabeça faz sentido) + markdown preview + git branch na statusline

## instalar

```bash
# 1. glow (markdown preview no terminal)
curl -sL https://github.com/charmbracelet/glow/releases/latest/download/glow_Linux_x86_64.tar.gz | tar -xz -C ~/.local/bin

# 2. configs
cp vimrc ~/.vimrc
cp colors/win95.vim ~/.vim/colors/
```

## estrutura

```
~/.vimrc           # config principal
~/.vim/colors/win95.vim  # tema
```

## keymaps

| tecla | ação |
|-------|------|
| space p | preview markdown (glow) |
| space P | preview com pager |
| space w | salvar |
| space q | sair |
| space nh | limpar highlight |
| jk | sair modo insert |

## cores do tema

- bg: #c0c0c0 (cinza win95)
- fg: #000000 (preto)
- blue: #000080 (azul titlebar)
- shadow: #808080 (cinza medio)
- red: #ff0000

headings markdown:
- h1/h2: azul bold
- h3/h4: cyan bold
- h5: verde bold
- h6: magenta bold

code inline: magenta + bg claro
code block: preto + bg claro
