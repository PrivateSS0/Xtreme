from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes
import os

def pad(data):
    return data + b"\0" * (16 - len(data) % 16)

def encrypt_folder(folder_path, output_file, key):
    iv = get_random_bytes(16)
    cipher = AES.new(key, AES.MODE_CBC, iv)
    full_data = b""

    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)

        if os.path.isfile(file_path) and not filename.endswith(".py"):
            with open(file_path, "rb") as f:
                content = f.read()
            full_data += f"---{filename}---".encode() + content + b"\n<<<EOF>>>\n"

    encrypted = iv + cipher.encrypt(pad(full_data))
    with open(output_file, "wb") as f:
        f.write(encrypted)

# ---------------------
# CLAVE "DIFICIL" PARA UNA MAQUINA
# ---------------------

def generate_key():
    # Lista de números en código ascii, mezclados y sin orden directo
    parts = [67, 108, 105, 110, 80, 82, 83, 116, 114, 111, 110, 103, 75, 101, 121, 33]
    # Aplicar una transformación tipo xor con un número arbitrario para "desordenar"
    xor_key = 17
    decoded = [p ^ xor_key for p in parts]
    # Volver a xor para recuperar la clave original (en el momento de usarla)
    final_key = bytes([c ^ xor_key for c in decoded])
    return final_key

key = generate_key()

folder_name = os.path.dirname(os.path.abspath(__file__))
output_file = os.path.join(folder_name, "data.bin")

encrypt_folder(folder_name, output_file, key)

print("✅ Archivos encriptados exitosamente en 'data.bin'")
