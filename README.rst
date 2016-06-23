======================
bash environment-setup
======================

A simple shell function and helper scripts to setup a user environment with
minimal effort. When working on multiple projects or on projects with complex
enviroments, it is not recomendable to configure the full environment in the
shell startup ``.profile`` or ``.bashrc``. Completion support is provided to
help to reduce the amount of typing needed.

The ``~/.setup.sh`` file should be sourced in the bash configuration, typically
in the ``~/.bashrc`` file.

The ``~/.setup.d`` directory contains the setup files, without any extension. 
Customized completions are provided by the ``*.compgen`` files. The ``.def``
files provide common definitions used for project setup and completions.

You probably want to customize the files in ``~/.setup.d`` to reflect your 
setup and working habits
