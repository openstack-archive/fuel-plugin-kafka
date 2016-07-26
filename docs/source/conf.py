import sys
import os
extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
project = u'The Kafka Cluster Plugin'
copyright = u'2016, Mirantis Inc.'
version = '0.1'
release = '0.1.0'
exclude_patterns = [
]
pygments_style = 'sphinx'
html_theme = 'default'
htmlhelp_basename = 'RedisPlugindoc'
latex_elements = {
}
latex_documents = [
  ('index', 'KafkaPlugindoc.tex', u'The Kafka Cluster Plugin',
   u'Mirantis Inc.', 'manual'),
]
man_pages = [
    ('index', 'kafkaplugin', u'The Kafka Cluster Plugin',
     [u'Mirantis Inc.'], 1)
]
texinfo_documents = [
  ('index', 'KafkaPlugin', u'The Kafka Cluster Plugin',
   u'Mirantis Inc.', 'KafkaPlugin', 'One line description of project.',
   'Miscellaneous'),
]
latex_elements = {'classoptions': ',openany,oneside', 'babel':
                  '\\usepackage[english]{babel}'}
