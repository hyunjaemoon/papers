#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p src build

# Check if there are any .tex files in src directory
if ! ls src/*.tex 1> /dev/null 2>&1; then
    echo "No .tex files found in src directory"
    exit 1
fi

# Process each .tex file in the src directory
for tex_file in src/*.tex; do
    # Get the filename without extension and path
    filename=$(basename "${tex_file%.*}")
    
    echo "Processing $tex_file..."
    
    # Compile the LaTeX document
    echo "Compiling $tex_file..."
    pdflatex -output-directory=build "$tex_file"
    
    # Run bibtex if bibliography exists
    if [ -f "src/$filename.bib" ]; then
        echo "Running BibTeX..."
        cd build
        bibtex "$filename"
        cd ..
        pdflatex -output-directory=build "$tex_file"
        pdflatex -output-directory=build "$tex_file"
    fi
    
    # Create output directory if it doesn't exist
    mkdir -p "$filename"
    
    # Move the pdf file to the output directory
    cp "build/$filename.pdf" "$filename/"
    
    echo "Files moved to directory: $filename/"
done

# Clean up auxiliary files in build directory
echo "Cleaning up auxiliary files..."
rm -f build/*.aux build/*.log build/*.out build/*.bbl build/*.blg

echo "Done! All PDFs have been generated in their respective output directories" 
