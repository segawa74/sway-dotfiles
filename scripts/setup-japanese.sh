#!/bin/bash
# Fedora Sway用 日本語入力パッケージインストールスクリプト
set -e

echo "📦 Fcitx5-Mozc 関連パッケージをインストールします..."
sudo dnf install -y fcitx5 fcitx5-mozc fcitx5-autostart fcitx5-gtk fcitx5-qt

echo "✅ パッケージのインストールが完了しました！"
echo "💡 Swayのconfigに 'exec fcitx5 -d' が追記されていることを確認し、再起動後に 'fcitx5-configtool' で設定を行ってください。"
