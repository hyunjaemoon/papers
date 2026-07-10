#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p src build

# Check if there are any .tex files in src directory
if ! ls src/*.tex 1> /dev/null 2>&1; then
    echo "No .tex files found in src directory"
    exit 1
fi

failed=0

# Process each .tex file in the src directory
for tex_file in src/*.tex; do
    # Get the filename without extension and path
    filename=$(basename "${tex_file%.*}")

    echo "Compiling $tex_file..."

    if ! pdflatex -interaction=nonstopmode -output-directory=build "$tex_file" > /dev/null; then
        echo "ERROR: compilation failed for $tex_file (see build/$filename.log)"
        failed=1
        continue
    fi

    # Run bibtex if bibliography exists
    if [ -f "src/$filename.bib" ]; then
        echo "Running BibTeX..."
        (cd build && bibtex "$filename")
        pdflatex -interaction=nonstopmode -output-directory=build "$tex_file" > /dev/null
    fi

    # Second pass so cross-references and hyperref outlines are stable
    if ! pdflatex -interaction=nonstopmode -output-directory=build "$tex_file" > /dev/null; then
        echo "ERROR: compilation failed for $tex_file (see build/$filename.log)"
        failed=1
        continue
    fi

    # Copy the pdf file to its output directory
    mkdir -p "$filename"
    cp "build/$filename.pdf" "$filename/"

    echo "Output: $filename/$filename.pdf"
done

# Clean up auxiliary files in build directory
echo "Cleaning up auxiliary files..."
rm -f build/*.aux build/*.log build/*.out build/*.bbl build/*.blg

if [ "$failed" -ne 0 ]; then
    echo "Done, but some documents failed to compile."
    exit 1
fi

echo "Done! All PDFs have been generated in their respective output directories"
