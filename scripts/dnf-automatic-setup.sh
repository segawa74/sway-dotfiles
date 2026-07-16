#!/bin/bash

# 1. dnf-automatic がインストールされていなければインストール
if ! rpm -q dnf-automatic > /dev/null 2>&1; then
    echo "Installing dnf-automatic..."
    sudo dnf install -y dnf-automatic
fi

# 2. 設定ファイルの書き換え（sed を使用）
CONF_FILE="/etc/dnf/automatic.conf"

if [ -f "$CONF_FILE" ]; then
    echo "Configuring dnf-automatic..."
    # upgrade_type を security に変更
    sudo sed -i 's/^upgrade_type =.*/upgrade_type = security/' "$CONF_FILE"
    # apply_updates を yes に変更
    sudo sed -i 's/^apply_updates =.*/apply_updates = yes/' "$CONF_FILE"
else
    echo "Warning: $CONF_FILE not found."
fi

# 3. systemd タイマーの有効化と起動
echo "Enabling dnf-automatic.timer..."
sudo systemctl enable --now dnf-automatic.timer

echo "dnf-automatic setup completed!"
