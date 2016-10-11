import sys
import os
extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
project = u'The Kafka plugin for Fuel'
copyright = u'2016, Mirantis Inc.'
version = '1.0'
release = '1.0.0'
exclude_patterns = [
]
pygments_style = 'sphinx'
html_theme = 'default'
htmlhelp_basename = 'KafkaPlugindoc'
latex_elements = {
}
latex_documents = [
  ('index', 'KafkaPlugindoc.tex', u'The Kafka plugin for Fuel documentation',
   u'Mirantis Inc.', 'manual'),
]
man_pages = [
    ('index', 'kafkaplugin', u'The Kafka plugin for Fuel',
     [u'Mirantis Inc.'], 1)
]
texinfo_documents = [
  ('index', 'KafkaPlugin', u'The Kafka plugin for Fuel',
   u'Mirantis Inc.', 'KafkaPlugin', 'One line description of project.',
   'Miscellaneous'),
]
latex_elements = {'classoptions': ',openany,oneside', 'babel':
                  '\\usepackage[english]{babel}'}
