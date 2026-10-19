#!/bin/bash

# ==========================================
# กำหนดตัวแปรสำหรับสีต่างๆ
# ==========================================
GREEN='\e[1;32m'
CYAN='\e[1;36m'
YELLOW='\e[1;33m'
NC='\e[0m'

echo -e "${CYAN}🚀 Starting Custom OS Setup...${NC}"

# 1. อัปเดตฐานข้อมูลและแพ็กเกจระบบ
echo -e "${YELLOW}📦 Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

# 2. ติดตั้งเครื่องมือพื้นฐาน, System Monitors และ CLI ยุคใหม่
echo -e "${YELLOW}🛠️ Installing Core Tools & Modern CLI...${NC}"
sudo apt install -y git curl wget btop tree fzf fastfetch zoxide

# 3. ตรวจสอบและติดตั้ง Starship
echo -e "${CYAN}⭐ Checking Starship prompt...${NC}"
if command -v starship &> /dev/null; then
    echo -e "${GREEN}   -> Starship is already installed. Skipping.${NC}"
else
    echo -e "${YELLOW}   -> Installing Starship...${NC}"
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# ==========================================
# 4. เชื่อมโยงไฟล์ตั้งค่า (Symlink Dotfiles)
# ==========================================
echo -e "${CYAN}🔗 Linking dotfiles...${NC}"

# สำรองไฟล์ .bashrc เดิมของเครื่องใหม่ (ถ้ามีและไม่ใช่ Symlink)
if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.backup
    echo -e "${YELLOW}   -> Backed up default .bashrc to .bashrc.backup${NC}"
fi

mkdir -p ~/.config

# สำรองไฟล์ starship.toml เดิม (ถ้ามีและไม่ใช่ Symlink)
if [ -f ~/.config/starship.toml ] && [ ! -L ~/.config/starship.toml ]; then
    mv ~/.config/starship.toml ~/.config/starship.toml.backup
    echo -e "${YELLOW}   -> Backed up default starship.toml to starship.toml.backup${NC}"
fi

# สร้างทางลัดไปยังไฟล์ตั้งค่าที่อยู่ในโฟลเดอร์ dotfiles
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
echo -e "${GREEN}   -> Symlinks created successfully.${NC}"

# ==========================================
# 5. ทำความสะอาดระบบ
# ==========================================
echo -e "${YELLOW}🧹 Cleaning up system cache and unused packages...${NC}"
sudo apt autoremove --purge -y
sudo apt clean

echo -e "${GREEN}✅ Setup Complete! Please restart your terminal to apply changes.${NC}"
