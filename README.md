# BRD Toolkit

Public repository สำหรับติดตั้งสกิลสร้าง Mini BRD ภาษาไทย ใช้ได้กับ Codex และ Claude Code

## ติดตั้งแบบคำสั่งเดียวหลัง clone

```bash
git clone https://github.com/Millzaber/brd-toolkit.git && cd brd-toolkit && chmod +x install.sh plugins/brd-toolkit/install.sh && ./install.sh both
```

หากใช้ GitHub CLI หรือ HTTPS credential:

```bash
gh repo clone Millzaber/brd-toolkit && cd brd-toolkit && chmod +x install.sh plugins/brd-toolkit/install.sh && ./install.sh both
```

ใช้ `./install.sh codex` หรือ `./install.sh claude` เมื่อต้องการติดตั้งเฉพาะระบบ สคริปต์จะสำรองสกิลเดิมก่อนติดตั้งทับ

อัปเดตภายหลัง:

```bash
cd brd-toolkit && git pull --ff-only && ./install.sh both
```

## ติดตั้งเป็น Codex marketplace

```bash
codex plugin marketplace add Millzaber/brd-toolkit
```

จากนั้นเปิด Plugins Directory ใน Codex เลือก marketplace `BRD Toolkit` และติดตั้ง `BRD Toolkit`

## ติดตั้งเป็น Claude Code plugin

```bash
claude plugin marketplace add Millzaber/brd-toolkit
claude plugin install brd-toolkit@brd-toolkit
```

เมื่อติดตั้งแบบ plugin คำสั่งจะเป็น `/brd-toolkit:brd-create` และ `/brd-toolkit:brd-help`

เมื่อติดตั้งด้วย `./install.sh` จะเรียกโดยตรงเป็น `/brd-create` และ `/brd-help`

## การเข้าถึง repository

Repository นี้เป็น Public จึง clone และเพิ่ม marketplace ได้ทันทีโดยไม่ต้องล็อกอิน GitHub

## ข้อกำหนดเครื่องปลายทาง

- ฟอนต์ TH SarabunPSK ที่ได้รับอนุญาต
- เครื่องมือสร้าง DOCX เช่น python-docx หรือเครื่องมือเอกสารของ agent
- LibreOffice หรือ renderer อื่นสำหรับตรวจรูปแบบเอกสาร

รายละเอียดสกิลและตัวอย่างเพิ่มเติมอยู่ที่ `plugins/brd-toolkit/README.md`
