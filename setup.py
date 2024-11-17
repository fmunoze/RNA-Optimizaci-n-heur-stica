from setuptools import setup, find_packages

# Leer el archivo requirements.txt
with open('requirements.txt') as f:
    requirements = f.read().splitlines()

setup(
    name='tu_proyecto',
    version='0.1',
    packages=find_packages(),
    install_requires=requirements,
)