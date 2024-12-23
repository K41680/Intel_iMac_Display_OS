from setuptools import setup, find_packages

setup(
    name="Intel_iMac_Display_OS",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "requests",
    ],
    entry_points={
        "console_scripts": [
            "build_iso=src.build_iso:main",
        ],
    },
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)