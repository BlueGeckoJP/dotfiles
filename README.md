# dotfiles

GNU Stowで管理する設定ファイル

## ディレクトリ構造

ツールごとにディレクトリを作り、その中にホームディレクトリからの相対パスで設定ファイルを配置する

```text
dotfiles/
├── README.md
└── starship/
    └── .config/
        └── starship.toml
```

## 適用

このリポジトリのルートで、適用するツールを指定する

```sh
stow -t "$HOME" starship
```

`-t "$HOME"` は、リンクの配置先にホームディレクトリを指定する
