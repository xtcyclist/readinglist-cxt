use Net::SCP;
use Net::SCP::Expect;
open (bib_file, $ARGV[0]);
open (OUTFILE, '>'."chengxuntao.html");
print OUTFILE "<table width=\"928\" border=\"1\">";
print OUTFILE "
    <caption>
		<em><strong><span class=\"style1\">Cheng Xuntao's Reading List</span><br/>&nbsp;</strong></em>&nbsp;
    </caption>
";
print OUTFILE "
  <tr>
    <th width=\"558\" scope=\"col\"><em>Paper</em></th>
    <th width=\"354\" scope=\"col\"><em>Author</em></th>
  </tr>
";
$title;
$author;
$i=0;
while (<bib_file>)
{
	chomp;
	if ($_ =~ /title/)
	{
		$string=$_;
		@array=split ('{',$string);
		@array=split ('}', $array[1]);
		#print $array[0];
		$title=$array[0];
		$original_title=$title;
		#$title = quotemeta $title;
		$title =~ s/\s/+/g;
		$url_title="<a href="."http://scholar.google.com/scholar?q=".$title."&btnG=&hl=en&as_sdt=0%2C5".">".$original_title."</a>";
		$i++;
	}
	if ($_ =~ /author/)
	{
		$string=$_;
		@array=split ('{',$string);
		@array=split ('}', $array[1]);
		#print $array[0];
		$author=$array[0];
		$i++;
	}
	if ($i>=2)
	{
		print OUTFILE "<tr><td>".$url_title."</td><td>".$author."</td></tr>";
		while ($_ !~ /@/ && <bib_file>)
		{
			$_=<bib_file>;
		}
		$i=0;
	}	
}
print OUTFILE "</table>";
my $filetrans = Net::SCP::Expect->new(host=>'155.69.144.210', user=>'chengxuntao', password=>'chengxuntao');
$filetrans->scp('chengxuntao.html','/share/MD0_DATA/Public/reading\ list/xuntao');
