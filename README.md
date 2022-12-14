# morphological-information-datasets
This collection of files contain datasets for 6 languages (Russian, Basque, Turkish, Spanish, Czech and English) that include morphological labels of different complexity. These files are ready to use and are suitable for training with such systems as IXA pipes, Morpheus, Flair and transfomer-based models.

## Content
1. [File source](#source)
2. [Label structure](#structure)
3. [File format](#format)


## File source
The source of our files are the CoNLL-U format files presented in the [SIGMORPHON 2019 Shared task](https://sigmorphon.github.io/sharedtasks/2019/task2/). They contain annotated phrases, where each word is annotated with all corresponding morphological information. During the preprocessing we extract only the wordforms, corresponding lemmas and morphological information necessary to form each label. 

## Label structure
In order to create the labels, we address the [Unimorph schema](https://unimorph.github.io/doc/unimorph-schema.pdf). We form labels of different morphological complexity: \
**UPOS** label: includes only word´s postag; \
**UPOS+Case+Gender**: includes postag, case and gender information of the word \
**UPOS+Case+Number**: includes postag, case and number information of the word \
**UPOS+Case+Gender+Number**:  includes postag, case and number information of the word \
**UPOS+AllFeaturesOrdered**: includes all the morphological information of the word in the following order: postag, case, gender, number, rest of the features \
**UPOS+AllFeaturesNotOrdered**: includes all the morphological information in the way it is presented in the original file 

## File format
The files have the following format: \\
word \t label \t lemma \
Each new phrase is divided by an empty line, mantaining the CoNLL-U file format \
There are files for training and further evaluation out-of-domain. For training there are 3 files (train, dev, and test) and there is a test file for evaluation for each of the languages.
