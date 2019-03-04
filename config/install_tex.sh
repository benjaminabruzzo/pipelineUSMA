mkdir ~/tex
sudo apt-get install -y texlive-full texstudio latexmk

echo " "
echo " "
echo " don't forget to add Latex tools to sublime"




    # Use kpsewhich biblatex.sty to get /usr/share/texlive/texmf-dist/tex/latex/biblatex/biblatex.st‌​y.
    # From SourceForge download biber v.2.6.
    # From SourceForge download biblatex v.3.6
    # Create two temp dirs: mkdir tempbb && mkdir tempbl

    # Uncompress biber-cygwin64.tar.gz and biblatex-3.6.tds.tgz to the temp directories:

    # tar -zxvf biber-cygwin64.tar.gz -C tempbb/
    # tar -zxvf biblatex-3.6.tds.tgz -C tempbl/

    # Move the contents of the files in the tempbl temp directory to /usr/share/texlive/texmf-dist/ thus:

    # sudo rsync -azvv tempbl/ /usr/share/texlive/texmf-dist/

    # Move the biber bin from your temp directory to /usr/share/texlive/ thus:

    # sudo rsync -azvv tempbl/ /usr/share/texlive/

    # Run mktexlsr
    # Test that everything is working fine.

