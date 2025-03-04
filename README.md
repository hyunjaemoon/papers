# LaTeX Document Compiler

This is a simple tool to compile LaTeX documents into PDF files. It helps you convert your LaTeX files (`.tex`) into readable PDF documents.

## Prerequisites

Before you can use this tool, you need to have:
- A Mac or Linux computer
- LaTeX installed on your computer (if you don't have it installed, you can install MacTeX for Mac or TeX Live for Linux)

## How to Use

1. Open your terminal (Command Prompt)
2. Navigate to the folder containing your LaTeX file
3. Run the following command:
   ```bash
   ./run_tex.sh your_file_name.tex
   ```
   Replace `your_file_name.tex` with the actual name of your LaTeX file.

### Example

If your LaTeX file is named `document.tex`, you would type:
```bash
./run_tex.sh document.tex
```

## What Happens

When you run the command:
1. The script will compile your LaTeX file
2. If successful, it will create a PDF file with the same name as your LaTeX file
3. The PDF will be saved in the same folder as your LaTeX file

## Troubleshooting

If you get a permission error when trying to run the script, you may need to make it executable first. You can do this by running:
```bash
chmod +x run_tex.sh
```

## Need Help?

If you encounter any issues or need help with LaTeX, please refer to the LaTeX documentation or seek assistance from someone familiar with LaTeX.
