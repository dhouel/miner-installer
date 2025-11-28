#!/bin/bash

echo "=== Atualizando sistema ==="
sudo apt update -y
sudo apt upgrade -y

echo "=== Instalando Flatpak ==="
sudo apt install flatpak -y

echo "=== Adicionando repositório Flathub ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== Instalando Moonlight ==="
sudo flatpak install flathub com.moonlight_stream.Moonlight -y

echo "=== Criando atalho no menu (Moonlight) ==="
mkdir -p ~/.local/share/applications

cat <<EOF > ~/.local/share/applications/moonlight.desktop
[Desktop Entry]
Name=Moonlight
Comment=Moonlight Game Streaming Client
Exec=flatpak run com.moonlight_stream.Moonlight
Icon=moonlight
Terminal=false
Type=Application
Categories=Game;
EOF

echo "=== Script concluído! ==="
echo "Moonlight instalado e disponível no menu."
echo "Para iniciar agora, execute:"
echo "flatpak run com.moonlight_stream.Moonlight"
