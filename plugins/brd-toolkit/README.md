# BRD Toolkit

แพ็กสกิลสำหรับสร้าง Mini BRD ภาษาไทยตามแบบฟอร์ม Pojjaman ใช้ได้กับ Codex และ Claude Code

## สกิลที่รวมมา

- `/brd-create` สร้าง DOCX พร้อม Scope, Out of Scope, FR และ AC
- `/brd-help` แนะนำข้อมูลที่ควรเตรียมและวิธีใช้งานแบบสั้น

## ติดตั้งอัตโนมัติ

แตกไฟล์ ZIP แล้วเปิด Terminal ในโฟลเดอร์ `brd-toolkit`

macOS / Linux:

```bash
chmod +x install.sh
./install.sh both
```

เลือกติดตั้งเฉพาะระบบได้ด้วย `./install.sh codex` หรือ `./install.sh claude`

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 both
```

สคริปต์จะสำรองสกิลเดิมเป็นโฟลเดอร์ `.backup-วันเวลา` ก่อนติดตั้งทับ

## ติดตั้งด้วยตนเอง

Codex: คัดลอก `skills/brd-create` และ `skills/brd-help` ไปที่ `~/.codex/skills/`

Claude Code: คัดลอกทั้งสองโฟลเดอร์ไปที่ `~/.claude/skills/` สำหรับใช้ทุกโปรเจกต์ หรือ `.claude/skills/` ใน repository สำหรับใช้เฉพาะโปรเจกต์

หลังติดตั้ง ให้เริ่ม task ใหม่ใน Codex ส่วน Claude Code ใช้ `/reload-skills` หาก session เดิมยังไม่พบสกิล

## วิธีใช้

```text
/brd-help
```

```text
/brd-create ผู้จัดทำคุณเอ บริษัท บี จำกัด ลูกค้าคุณซี ต้องการเพิ่ม Report X ให้แสดงเปอร์เซ็นต์
```

หากไม่ระบุวันที่ สกิลจะใช้วันที่ปัจจุบัน หากข้อมูลจำเป็นยังไม่ครบ สกิลจะถามกลับแบบสั้นก่อนสร้างเอกสาร

## สิ่งที่เครื่องต้องมี

- ฟอนต์ `TH SarabunPSK` ที่ได้รับอนุญาตให้ใช้งาน
- เครื่องมือแก้ไข DOCX เช่น `python-docx` หรือเครื่องมือเอกสารที่มากับ agent
- LibreOffice หรือ renderer อื่นสำหรับตรวจรูปแบบทุกหน้าก่อนส่งเอกสาร

ไฟล์ต้นแบบอยู่ที่ `skills/brd-create/assets/mini-brd-master.docx` ไม่ควรแก้ทับโดยตรง

## การเรียกผ่าน plugin

แพ็กมีทั้ง `plugin.json`, `.codex-plugin/plugin.json` และ `.claude-plugin/plugin.json` สำหรับนำไปวางใน marketplace หรือ repository ของทีม หากติดตั้งเป็น Claude Code plugin ชื่อคำสั่งอาจแสดงแบบมี namespace เช่น `/brd-toolkit:brd-create` ส่วนการติดตั้งด้วยสคริปต์ด้านบนจะใช้ `/brd-create` โดยตรง
