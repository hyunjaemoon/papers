# Papers

Hyun Jae Moon's papers and resumes, written in LaTeX. Sources live in `src/`, and each compiled PDF is published in its own folder (e.g. `src/resume.tex` → `resume/resume.pdf`).

## Documents

- `resume/` and `resume_korean/` — resume (English and Korean)
- `fun_random/` — The Fun Randomness Algorithm
- `immersive_games/` — Immersive Games
- `reactive_hitl_game_dev/` — Reactive Human-in-the-Loop Game Development
- `zuzu_claude_code/` — ZUZU and Claude Code: The One-Person, Two-Country Software Company
- `zuzu_claude_code_korean/` — 위 논문의 한국어판 (ZUZU와 Claude Code: 1인 · 양국 소프트웨어 회사)

## Prerequisites

- macOS or Linux
- A LaTeX distribution (MacTeX on macOS, TeX Live on Linux)

## Building

Run the build script from the repository root:

```bash
./run_tex.sh
```

The script compiles every `.tex` file in `src/`:
1. Each document is compiled twice with `pdflatex` (plus a BibTeX pass if a matching `.bib` file exists in `src/`) so cross-references and PDF outlines are stable.
2. The resulting PDF is copied to a folder named after the document (e.g. `resume/resume.pdf`).
3. Auxiliary files are cleaned up; intermediates stay in `build/` (git-ignored).

## Troubleshooting

- Permission error running the script: `chmod +x run_tex.sh`
- A document fails to compile: the script reports it and points to the log in `build/<name>.log`
