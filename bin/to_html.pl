#!/usr/bin/env perl

use 5.016;
use File::Slurp qw(read_file write_file);
use Text::Markdown qw(markdown);

foreach my $md_fn ( @ARGV ) {
    my $text = read_file( $md_fn, { binmode => ':utf8' } ) 
        or die "Couldn't read $md_fn: $!\n";

    my $html = markdown($text);

    my $html_fn = $md_fn =~ s/\.md/\.html/r;
    write_file( $html_fn, { binmode => ':utf8' }, \$html ) 
        or die "Couldn't write $html_fn: $!\n";
}

