{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python312.buildEnv.override {
      extraLibs = with python312Packages; [
         black
         boto3
         botocore
         isort
         jupyterlab
         memory-profiler
         mypy
         openpyxl
         pandas
         pip
         pyarrow
         pydantic
         pynvim
         pytest
         pytest-mock
         regex
         requests
         termcolor
         virtualenv
         wheel
         xlrd
         numpy

    #     beautifulsoup4
    #     click
    #     fuzzywuzzy
    #     jinja2 
    #     matplotlib
    #     moto
    #     networkx
    #     numpy
    #     opencv4
    #     pandas
    #     pytesseract
    #     pytest
    #     pyvis
    #     requests
    #     scipy
    #     scrapy
    #     tkinter
       ];
     })
  ];
}
