set -e

mkdir -p res/1_genome_selection/assembly_reports

echo
echo "a. Search for relevant genomes."
echo '-------------------------------'
echo

echo "Exploring fungi genomes ..."
datasets summary genome taxon 4751 --reference --annotated --assembly-level chromosome > res/1_genome_selection/assembly_reports/fungi_relevant_genome.json
total_count=$(cat res/1_genome_selection/assembly_reports/fungi_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/1_genome_selection/assembly_reports/fungi_relevant_genome.json)"
echo

echo "Exploring vertebrates genomes ..."
datasets summary genome taxon 7742 --reference --annotated --assembly-level chromosome > res/1_genome_selection/assembly_reports/vertebrates_relevant_genome.json
total_count=$(cat res/1_genome_selection/assembly_reports/vertebrates_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/1_genome_selection/assembly_reports/vertebrates_relevant_genome.json)"
echo

echo "Exploring metazoa (vertebrates+invertebrates) genomes ..."
datasets summary genome taxon 33208 --reference --annotated --assembly-level chromosome > res/1_genome_selection/assembly_reports/metazoa_relevant_genome.json
total_count=$(cat res/1_genome_selection/assembly_reports/metazoa_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/1_genome_selection/assembly_reports/metazoa_relevant_genome.json)"
echo

echo "Exploring embryophyta (land plants) genomes ..."
datasets summary genome taxon 3193 --reference --annotated --assembly-level chromosome > res/1_genome_selection/assembly_reports/embryophyta_relevant_genome.json
total_count=$(cat res/1_genome_selection/assembly_reports/embryophyta_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/1_genome_selection/assembly_reports/embryophyta_relevant_genome.json)"
echo


mkdir -p res/1_genome_selection/taxID

echo
echo "b. Extraction of taxID from relevant genomes."
echo '---------------------------------------------'
echo

for file_in in $(ls -d res/1_genome_selection/assembly_reports/*)
do
    file_out=$(echo $file_in | sed 's#genome.json#taxID.txt#g' | sed 's#assembly_reports#taxID#g')
    cat $file_in | jq .reports[].organism.tax_id > $file_out
done

echo "Done !"