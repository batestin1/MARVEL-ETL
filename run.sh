#!/bin/bash

#!/bin/bash

# Instala o inotify-tools
sudo apt-get update && sudo apt-get install -y inotify-tools

# Verifica se o inotify-tools foi instalado com sucesso
if [ $? -eq 0 ]; then
  echo "O inotify-tools foi instalado com sucesso."
else
  echo "Ocorreu um erro durante a instalação do inotify-tools."
fi

# Executa o script Python
python3 script/insert_on_dataset.py

