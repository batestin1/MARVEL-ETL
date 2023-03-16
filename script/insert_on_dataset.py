import requests
import hashlib
import csv
import os
import json
import random
import string

with open('param/param.json') as f:
    keys = json.load(f)

#recover variable
url = keys['url']
public_key = keys['public_key']
private_key = keys['private_key']
encode = keys['encode']

timestamp = '1' 
hash_value = hashlib.md5((timestamp + private_key + public_key).encode(encode)).hexdigest()


params = {
    'apikey': public_key,
    'ts': timestamp,
    'hash': hash_value,
    'limit': 100
}

all_characters = []

while True:
    response = requests.get(url, params=params)
    data = response.json()
    all_characters.extend(data['data']['results'])

    if len(all_characters) == data['data']['total']:
        break

    params['offset'] = len(all_characters)

# Cria a pasta "dataset" se ela não existir
if not os.path.exists('dataset'):
    os.makedirs('dataset')

# Cria o arquivo "marvel.csv" na pasta "dataset"
csv_path = os.path.join('dataset', 'marvel.csv')
with open(csv_path, 'a+', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)

    # Se o arquivo estiver vazio, escreve o cabeçalho
    if os.path.getsize(csv_path) == 0:
        writer.writerow(['Nome', 'Descrição', 'Imagem', "id_"])

    # Escreve as informações de cada personagem no arquivo
    for character in all_characters:
        alpha = random.choice(string.ascii_lowercase).upper()
        number = random.randint(11111,99999)
        name = character['name']
        description = character['description']
        image_url = f"{character['thumbnail']['path']}.jpg"
        id_ = f"{alpha}{number}{alpha}{number}"


        writer.writerow([name, description, image_url,id_])

print('Arquivo CSV criado/atualizado com sucesso!')
