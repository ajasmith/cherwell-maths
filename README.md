# Cherwell Maths Slides

LaTeX Beamer document class for Cherwell School mathematics lessons, with school branding and sensible defaults for maths teaching.

## Quick start

```latex
\documentclass{cherwellmaths}

\title{Introduction to Quadratics}
\subtitle{Year 10 Mathematics}
\author{A. Teacher}

\begin{document}

\section{Topic One}

\begin{frame}{Frame Title}
  Slide content here.
\end{frame}

\end{document}
```

A title page and table of contents are generated automatically — just start writing sections and frames.

## Building

Use the build script to generate both a presentation PDF and an accessible PDF:

```
generate_slides.bat quadratics
```

This produces:
- `quadratics.pdf` — presentation slides with pauses and branding
- `quadratics-accessible.pdf` — high-contrast (black on white), no branding/background, no overlays, 1.5× larger fonts

## Branding

The class automatically applies Cherwell School branding to every slide:

| Asset | Placement |
|-------|-----------|
| `cherwellswanoverlay.png` | Full-slide background image |
| `cherwellbanner.png` | Top-right corner |
| `cherwellswan.png` | Bottom-right (clickable link back to contents) |


## Colours

Four colours are defined, with `cherwellaccent` used wherever a touch of colour is needed:

| Name | Hex | Usage |
|------|-----|-------|
| `cherwellblack` | `#000000` | Body text |
| `cherwellwhite` | `#FFFFFF` | Title text, backgrounds |
| `cherwellgrey` | `#D3D3D3` | Theorem box fills |
| `cherwellaccent` | `#23ACC3` | Structure, bullets, box frames, highlights, frame titles |

## Fonts

Open Sans is used throughout. Titles and frame headings are bold.

## Environments

### Definitions, theorems, and examples

```latex
\begin{defn}{Title}{label}
  Content
\end{defn}

\begin{thm}{Title}{label}
  Content
\end{thm}

\begin{exmp}{Title}{label}
  Content
\end{exmp}
```

### Side-by-side layout

Place visuals alongside bullet points. Choose which side the visual appears on:

```latex
\sidebyside{<visual>}{<text>}    % visual on left
```

### Incremental reveals

Use `\pause` for manual reveal breaks, or `[<+->]` on itemize for automatic one-by-one reveals:

```latex
\begin{itemize}[<+->]
  \item First point
  \item Second point
\end{itemize}
```

## Convenience macros

| Macro | Output |
|-------|--------|
| `\R` | ℝ |
| `\Z` | ℤ |
| `\N` | ℕ |
| `\Q` | ℚ |
| `\abs{x}` | \|x\| |
| `\set{1,2,3}` | {1, 2, 3} |
| `\highlight{x}` | Bold accent-coloured text |

## File structure

```
cherwellmaths.cls       — Document class
cherwellbanner.png      — School banner image
cherwellswan.png        — Swan logo
cherwellswanoverlay.png — Background watermark
generate_slides.bat     — Build script (slides + accessible)
quadratics.tex          — Example presentation
```
