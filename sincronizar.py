#!/usr/bin/env python3
"""
Script para sincronizar projeto FS Celulares com Google Drive
Copia tudo automaticamente para a pasta do Google Drive
"""

import os
import shutil
import sys
from pathlib import Path

def main():
    # Detectar caminho do Google Drive
    possible_paths = [
        Path.home() / "Google Drive",
        Path.home() / "My Drive",
        Path.home() / "OneDrive" / "Google Drive",
        Path("C:\\") / "Google Drive",
        Path("C:\\") / "My Drive",
    ]

    google_drive_path = None
    for path in possible_paths:
        if path.exists():
            google_drive_path = path
            break

    if not google_drive_path:
        print("❌ Google Drive Desktop não foi encontrado!")
        print("\nProcurei em:")
        for path in possible_paths:
            print(f"  - {path}")
        print("\n✅ SOLUÇÃO:")
        print("1. Instale Google Drive Desktop: https://www.google.com/drive/download/")
        print("2. Abra e configure a pasta local")
        print("3. Execute este script novamente")
        sys.exit(1)

    print(f"✅ Google Drive encontrado em: {google_drive_path}")

    # Caminhos
    projeto_path = Path(__file__).parent
    destino_path = google_drive_path / "FS-Celulares-Projeto"

    # Criar pasta de destino
    print(f"\n📁 Criando pasta: {destino_path}")
    destino_path.mkdir(parents=True, exist_ok=True)

    # Arquivos/pastas para NÃO copiar
    ignorar = {
        '.git',
        '.claude',
        '__pycache__',
        '.pytest_cache',
        'node_modules',
        '.env.old',
    }

    # Copiar arquivos
    print(f"\n📋 Copiando arquivos de {projeto_path}...")

    copiados = 0
    for item in projeto_path.rglob('*'):
        # Ignorar certos arquivos/pastas
        if any(ignorar_item in item.parts for ignorar_item in ignorar):
            continue

        # Caminho relativo
        rel_path = item.relative_to(projeto_path)
        destino_item = destino_path / rel_path

        try:
            if item.is_file():
                # Criar pasta pai se não existir
                destino_item.parent.mkdir(parents=True, exist_ok=True)
                # Copiar arquivo
                shutil.copy2(item, destino_item)
                print(f"  ✅ {rel_path}")
                copiados += 1
            elif item.is_dir() and not any(ignorar_item == item.name for ignorar_item in ignorar):
                # Criar diretório
                destino_item.mkdir(parents=True, exist_ok=True)
        except Exception as e:
            print(f"  ⚠️  Erro ao copiar {rel_path}: {e}")

    print(f"\n✅ Total de arquivos copiados: {copiados}")

    # Resumo final
    print("\n" + "="*70)
    print("🎉 SINCRONIZAÇÃO COMPLETA!")
    print("="*70)
    print(f"\n📍 Projeto sincronizado em:")
    print(f"   {destino_path}")
    print(f"\n✨ O Google Drive Desktop sincronizará automaticamente em segundos...")
    print(f"\n🌐 Acesse online em: https://drive.google.com")
    print(f"   Procure pela pasta: FS-Celulares-Projeto")
    print(f"\n💻 Outro PC:")
    print(f"   1. Instale Google Drive Desktop")
    print(f"   2. Faça login com mesma conta Google")
    print(f"   3. Acesse a pasta: {destino_path.parent / 'FS-Celulares-Projeto'}")
    print(f"\n✅ Tudo pronto para outro Claude!")
    print("="*70)

if __name__ == "__main__":
    main()
