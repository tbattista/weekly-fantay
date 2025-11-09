#!/bin/bash

echo "========================================"
echo "Fantasy Weekly Data Generator"
echo "========================================"
echo ""

# Check if API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "ERROR: OPENAI_API_KEY not set!"
    echo ""
    echo "Please set your OpenAI API key first:"
    echo "  export OPENAI_API_KEY=sk-your-key-here"
    echo ""
    echo "Then run this script again."
    exit 1
fi

echo "Checking dependencies..."
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
    echo ""
fi

echo ""
echo "Starting data generation..."
echo "This will take 2-3 minutes..."
echo ""

node generate-weekly-data.js

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "SUCCESS! Data generated successfully"
    echo "========================================"
    echo ""
    echo "Next steps:"
    echo "1. Review the generated data file"
    echo "2. Run: git add ../data/*.json"
    echo "3. Run: git commit -m 'Update Week data'"
    echo "4. Run: git push"
    echo ""
else
    echo ""
    echo "========================================"
    echo "ERROR: Data generation failed"
    echo "========================================"
    echo ""
    echo "Check the error messages above."
    echo ""
    exit 1
fi