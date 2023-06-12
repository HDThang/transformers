#!/bin/bash
##    SETTINGS     ## 
MODEL=xlm-roberta-base
LOGGING_STEPS=100
alias mydate="date  +'%Y-%m-%d_%H:%M:%S'"
## END OF SETTINGS ## 

BATCH_SIZE=64

LOG_FILE=${MODEL}_`training_log`.log
# gpu1
moreh-smi device --switch 4

python run_qa.py \
  --model_name_or_path ${MODEL} \
  --dataset_name squad_v2 \
  --do_train \
  --do_eval \
  --version_2_with_negative \
  --per_device_train_batch_size ${BATCH_SIZE} \
  --per_device_eval_batch_size ${BATCH_SIZE} \
  --learning_rate 3e-5 \
  --num_train_epochs 2 \
  --max_seq_length 384 \
  --doc_stride 128 \
  --output_dir /tmp/debug_squad/ \
  --overwrite_output_dir \

#tmux capture-pane -pS -300 > ${LOG_FILE}_training_log.log
#python ../../../../uploadS3.py ${LOG_FILE}
