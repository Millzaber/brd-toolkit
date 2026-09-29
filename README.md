# BRD Toolkit Private Repository

Private Git repository สำหรับแจกสกิลสร้าง Mini BRD ให้ทีม ใช้ได้กับ Codex และ Claude Code

## ติดตั้งแบบคำสั่งเดียวหลัง clone

```bash
git clone git@github.com:Millzaber/brd-toolkit.git brd-toolkit-private && cd brd-toolkit-private && chmod +x install.sh plugins/brd-toolkit/install.sh && ./install.sh both
```

หากใช้ GitHub CLI หรือ HTTPS credential:

```bash
gh repo clone Millzaber/brd-toolkit brd-toolkit-private && cd brd-toolkit-private && chmod +x install.sh plugins/brd-toolkit/install.sh && ./install.sh both
```

ใช้ `./install.sh codex` หรือ `./install.sh claude` เมื่อต้องการติดตั้งเฉพาะระบบ สคริปต์จะสำรองสกิลเดิมก่อนติดตั้งทับ

อัปเดตภายหลัง:

```bash
cd brd-toolkit-private && git pull --ff-only && ./install.sh both
```

## ติดตั้งเป็น Codex marketplace

```bash
codex plugin marketplace add Millzaber/brd-toolkit
```

จากนั้นเปิด Plugins Directory ใน Codex เลือก marketplace `BRD Toolkit Private` และติดตั้ง `BRD Toolkit`

## ติดตั้งเป็น Claude Code plugin

```bash
claude plugin marketplace add Millzaber/brd-toolkit
claude plugin install brd-toolkit@brd-toolkit-private
```

เมื่อติดตั้งแบบ plugin คำสั่งจะเป็น `/brd-toolkit:brd-create` และ `/brd-toolkit:brd-help`

เมื่อติดตั้งด้วย `./install.sh` จะเรียกโดยตรงเป็น `/brd-create` และ `/brd-help`

## สิทธิ์เข้าถึง private repository

ผู้ใช้แต่ละคนต้องได้รับสิทธิ์ repository และตั้งค่า SSH key หรือเข้าสู่ระบบ Git credential ของ Git host ก่อน clone หรือเพิ่ม marketplace

## ข้อกำหนดเครื่องปลายทาง

- ฟอนต์ TH SarabunPSK ที่ได้รับอนุญาต
- เครื่องมือสร้าง DOCX เช่น python-docx หรือเครื่องมือเอกสารของ agent
- LibreOffice หรือ renderer อื่นสำหรับตรวจรูปแบบเอกสาร

รายละเอียดสกิลและตัวอย่างเพิ่มเติมอยู่ที่ `plugins/brd-toolkit/README.md`
