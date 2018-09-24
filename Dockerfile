FROM jupyter/scipy-notebook

USER root

RUN conda update pandas numpy seaborn

RUN pip install yapf && \
    jupyter nbextension install https://github.com/jfbercher/yapf_ext/archive/master.zip && \
    jupyter nbextension enable yapf_ext-master/yapf_ext

ENV GRANT_SUDO yes

ENV PYTHONPATH $PYTHONPATH:/workingdir

CMD cd /workingdir && start-notebook.sh \
        --allow-root \
	--NotebookApp.token="abc" \
        --NotebookApp.notebook_dir=/workingdir
