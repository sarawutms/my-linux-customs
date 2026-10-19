# 🐧 My Linux Customs & Dotfiles

[![OS - Linux](https://img.shields.io/badge/OS-Linux%20%2F%20Debian%20%2F%20WSL-orange?logo=linux&logoColor=white)](#)
[![Shell - Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](#)
[![Prompt - Starship](https://img.shields.io/badge/Prompt-Starship-DD0B78?logo=starship&logoColor=white)](https://starship.rs)
[![Maintenance - Active](https://img.shields.io/badge/Maintenance-Active-brightgreen)](#)

ชุดไฟล์ตั้งค่าส่วนตัว (**Dotfiles**) และสคริปต์ติดตั้งอัตโนมัติ (**1-Command Setup**) สำหรับระบบปฏิบัติการ **Linux / Debian / Ubuntu / WSL** เพื่อเนรมิต Terminal ให้สวยงาม ทันสมัย ใช้งานง่าย และพร้อมทำงานทันทีในทุกเครื่องใหม่

---

## ✨ ไฮไลท์และฟีเจอร์เด่น (Features)

- ⚡ **1-Command Setup:** รันสคริปต์สั้นๆ เพียงคำสั่งเดียว ระบบจะอัปเดต ติดตั้งเครื่องมือ และตั้งค่าให้อัตโนมัติทั้งหมด
- 🎨 **Minimal & Modern Prompt:** ปรับแต่งหน้าตา Terminal ด้วย **Starship** แบบ 2 บรรทัด สะอาดตา แสดงสถานะ Git, โฟลเดอร์, และเวลาที่ใช้รันคำสั่ง
- 🛠️ **Next-Gen CLI Tools:** รวมเครื่องมือวิเคราะห์ระบบและค้นหาไฟล์ยุคใหม่ (`btop`, `fastfetch`, `fzf`, `zoxide`)
- 🔗 **Smart Symlink Management:** เชื่อมโยงไฟล์ตั้งค่าด้วย Symbolic Link ปรับแต่งที่ `~/.bashrc` หรือ `.config` ไฟล์ในโฟลเดอร์ `~/dotfiles` จะอัปเดตตามทันที พร้อมสำหรับ `git push`
- 🛡️ **Safe Backup:** ตรวจสอบและสำรองไฟล์ `~/.bashrc` เดิมไว้เป็น `~/.bashrc.backup` ก่อนสร้าง Symlink ปลอดภัย 100%
- 🧹 **Auto Cleanup:** ทำความสะอาดแพ็กเกจขยะและแคชของระบบหลังติดตั้งเสร็จ เพื่อประหยัดพื้นที่ดิสก์

---

## 📦 เครื่องมือที่ติดตั้งในระบบ (Included Tools)

| เครื่องมือ | คำสั่งที่ใช้ | คำอธิบายและความสามารถ |
| :--- | :--- | :--- |
| **Starship** | `starship` | Prompt ยุคใหม่ที่รวดเร็ว ปรับแต่งได้ยืดหยุ่น รองรับ Git integration ในตัว |
| **Fastfetch** | `fastfetch` | แสดงข้อมูลสเปกเครื่อง OS และ Kernel แบบสวยงามและรวดเร็วสุดๆ (ทางเลือกใหม่แทน neofetch) |
| **Btop** | `btop` | ตัวมอนิเตอร์ CPU, RAM, Disk, Network และ Process แบบ UI สวยงามและ Interactive |
| **Htop** | `htop` | Process viewer คลาสสิก น้ำหนักเบา สำหรับดูและจัดการ Process ในระบบ |
| **Fzf** | `fzf` | Command-line Fuzzy Finder สำหรับค้นหาไฟล์และประวัติคำสั่งได้อย่างรวดเร็ว |
| **Zoxide** | `z` | เครื่องมือช่วยเปลี่ยนโฟลเดอร์อัจฉริยะ (Smarter `cd` command) จำไดเรกทอรีที่ใช้บ่อย |
| **Tree** | `tree` | แสดงโครงสร้างไฟล์และไดเรกทอรีในรูปแบบแผนภูมิต้นไม้ |
| **Git / Curl / Wget** | `git`, `curl`, `wget` | ชุดเครื่องมือพื้นฐานสำหรับนักพัฒนาและการดาวน์โหลดไฟล์ |

---

## 🚀 วิธีติดตั้งบนเครื่องใหม่ (Quick Start)

เมื่อคุณไปใช้งาน Linux เครื่องใหม่, WSL หรือ Cloud Server สามารถเสกทุกอย่างกลับมาให้เป็นแบบที่คุณคุ้นเคยได้ทันทีด้วย 2 ขั้นตอนนี้ครับ:

### 1. โคลนไฟล์จาก GitHub ลงเครื่องใหม่ (ดาวน์โหลดโค้ด)
เปิด Terminal ในเครื่องใหม่แล้วรันคำสั่งนี้ (ไม่ต้องใช้รหัสผ่านเพราะเป็น Public repo):
```bash
git clone https://github.com/sarawutms/my-linux-customs.git ~/dotfiles
```

### 2. สั่งรันสคริปต์ติดตั้งระบบ (ติดตั้งอัตโนมัติ)
เข้าไปในโฟลเดอร์ เปิดสิทธิ์ให้ไฟล์ และสั่งรันรวดเดียวจบ:
```bash
cd ~/dotfiles && chmod +x setup.sh && ./setup.sh
```

> **💡 คำแนะนำหลังติดตั้ง:**  
> สคริปต์จะทำการอัปเดตระบบ โหลดเครื่องมือล้ำๆ อย่าง `btop`, `fastfetch`, `starship` และเชื่อมโยงไฟล์ตั้งค่า (Symlink) ทั้งหมดให้อัตโนมัติ เมื่อรันเสร็จแล้วให้ปิด-เปิด Terminal ใหม่ หรือพิมพ์ `source ~/.bashrc` เพื่อเริ่มต้นใช้งานทันที!

---

## 🎨 หน้าตา Terminal Prompt (Starship Preview)

การจัดรูปแบบ Prompt แบ่งเป็น 2 บรรทัด เพื่อความสะดวกในการพิมพ์คำสั่งยาวๆ:

```text
📂 ~/dotfiles 🌱 main [!] ⏱ 2s
❯❯ 
```

### ความหมายของสัญลักษณ์:
- `📂 [directory]` : แสดงตำแหน่งโฟลเดอร์ปัจจุบัน (จำกัดความลึกไม่เกิน 3 ชั้น)
- `🌱 [git_branch]` : ชื่อ Branch ของ Git ปัจจุบัน (จะปรากฏเฉพาะเมื่ออยู่ในโฟลเดอร์ที่เป็น Git repo)
- `[git_status]` : สถานะไฟล์ Git เช่น มีการแก้ไข, ลบ หรือเพิ่มไฟล์ใหม่ (แสดงสีแดงเมื่อมีไฟล์ค้าง)
- `⏱ [cmd_duration]` : จับเวลาการรันคำสั่ง (จะแสดงไอคอนนาฬิกาก็ต่อเมื่อคำสั่งนั้นใช้เวลาเกิน 2 วินาที)
- `❯❯ [character]` : สัญลักษณ์พร้อมรับคำสั่ง (สีเขียวเมื่อคำสั่งก่อนหน้าสำเร็จ / `✗` สีแดงเมื่อคำสั่งก่อนหน้าล้มเหลว)

---

## 📁 โครงสร้างโปรเจกต์ (Project Structure)

```text
~/dotfiles/
├── .config/
│   └── starship.toml    # ไฟล์ตั้งค่ารูปแบบหน้าตาของ Starship prompt
├── .bashrc              # การตั้งค่า Bash Shell และ Alias (เช่น ll, starship init)
├── setup.sh             # สคริปต์ติดตั้งแพ็กเกจอัตโนมัติและสร้าง Symlink
└── README.md            # เอกสารประกอบการใช้งาน
```

---

## 🔗 เบื้องหลังการทำงานของ Symlinks (How it Works)

สคริปต์ `setup.sh` จะสร้าง **Symbolic Link** จากโฟลเดอร์ `~/dotfiles` ไปยังโฟลเดอร์ Home (`~`):

```text
~/.bashrc              --->   ~/dotfiles/.bashrc
~/.config/starship.toml --->   ~/dotfiles/.config/starship.toml
```

> **ข้อดี:** เวลาคุณแก้ไขไฟล์ `~/.bashrc` หรือปรับแต่ง Theme ใน `~/.config/starship.toml` ค่าที่แก้จะถูกบันทึกมายัง `~/dotfiles` ทันที ทำให้สามารถ Commit และ Push ขึ้น GitHub ได้สะดวกรวดเร็วโดยไม่ต้อง Copy ไฟล์ไปมา

---

## 🔄 ขั้นตอนการทำงานประจำวัน (Daily Workflow)

### เมื่อมีการแก้ไขหรือเพิ่มการตั้งค่าใหม่:
```bash
cd ~/dotfiles
git status
git add .
git commit -m "Update bash aliases and theme"
git push
```

### เมื่อต้องการอัปเดตการตั้งค่าล่าสุดบนเครื่องอื่น:
```bash
cd ~/dotfiles
git pull
source ~/.bashrc
```

---

## 👤 Author

- **GitHub:** [@sarawutms](https://github.com/sarawutms)
- **Repository:** [my-linux-customs](https://github.com/sarawutms/my-linux-customs)
