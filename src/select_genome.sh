set -e

mkdir -p res/assembly_reports

echo
echo "I. Search for relevant genomes."
echo '-------------------------------'
echo

echo "Exploring fungi genomes ..."
datasets summary genome taxon 4751 --reference --annotated --assembly-level chromosome > res/assembly_reports/fungi_relevant_genome.json
total_count=$(cat res/assembly_reports/fungi_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/assembly_reports/fungi_relevant_genome.json)"
echo

echo "Exploring vertebrates genomes ..."
datasets summary genome taxon 7742 --reference --annotated --assembly-level chromosome > res/assembly_reports/vertebrates_relevant_genome.json
total_count=$(cat res/assembly_reports/vertebrates_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/assembly_reports/vertebrates_relevant_genome.json)"
echo

echo "Exploring metazoa (vertebrates+invertebrates) genomes ..."
datasets summary genome taxon 33208 --reference --annotated --assembly-level chromosome > res/assembly_reports/metazoa_relevant_genome.json
total_count=$(cat res/assembly_reports/metazoa_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/assembly_reports/metazoa_relevant_genome.json)"
echo

echo "Exploring embryophyta (land plants) genomes ..."
datasets summary genome taxon 3193 --reference --annotated --assembly-level chromosome > res/assembly_reports/embryophyta_relevant_genome.json
total_count=$(cat res/assembly_reports/embryophyta_relevant_genome.json | jq '.total_count')
echo $total_count genomes found "(written in res/assembly_reports/embryophyta_relevant_genome.json)"
echo
