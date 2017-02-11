/* Code for word count */


input_lines = LOAD '/tmp/word.txt' AS (line:chararray)

words = FOREACH input_lines GENERATE FLATTEN(TOKENIZE(LINE)) AS word;
filtered_words = FILTER  words BY word MATCHES '\\w+';
word_groups = GROUP filtered_words BY word;
word_count = FOREACH word_groups GENERATE COUNT(filtered_words) AS count, group as word;
ordered_word_count = ORDER word_count BY  count DESC;
STORE ordered_word_count INTO 'tmp/result_word_count.txt'

##########################################################
Sample data 1: 
id,name,calories,protein,fat,carbs
1,Ajay,90,6,1,10
2,Bijay,80,7,2,4
3,Cijay,200,21,14,12
4,Dijay,120,12,3,6
5,Sanjay,150,21,14,16
8,Vijay,130,13,12,22


Q.1 Select records having calories > 100

cerel=FOREACH cerel GENERATE name,calories,protein;
cerel_filter=FILTER cerel BY calories>100;
DUMP cerel_filter;
==============================================

## Apple Stock Data 
index_raw=  LOAD '/data/Apple-Historical-Price_data.csv' using PigStorage(',') AS (date,open, high,low,close,volume,adj_close);
dump index_raw;

index_values= FOREACH index_raw GENERATE date,high,low,volume;
dump index_values;

filter_high = FILTER index_values BY high > 40;
DUMP FILTER_HIGH;

