---
license: other
tags:
- image-segmentation
- vision
- generated_from_trainer
model-index:
- name: segformer_outputs
  results: []
---

<!-- This model card has been generated automatically according to the information the Trainer had access to. You
should probably proofread and complete it, then remove this comment. -->

# segformer_outputs

This model is a fine-tuned version of [nvidia/mit-b0](https://huggingface.co/nvidia/mit-b0) on the segments/sidewalk-semantic dataset.

## Model description

More information needed

## Intended uses & limitations

More information needed

## Training and evaluation data

More information needed

## Training procedure

### Training hyperparameters

The following hyperparameters were used during training:
- learning_rate: 6e-05
- train_batch_size: 64
- eval_batch_size: 64
- seed: 42
- optimizer: Adam with betas=(0.9,0.999) and epsilon=1e-08
- lr_scheduler_type: polynomial
- num_epochs: 3.0

### Training results



### Framework versions

- Transformers 4.27.1
- Pytorch 1.7.1+cu110.moreh23.5.0
- Datasets 2.12.0
- Tokenizers 0.13.3
