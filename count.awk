#### gawk -f count_fur_colors.awk squirrel_cleaner.csv | sort -k2,2nr 

BEGIN {
    FS = ","
    total = 0
}

NR > 1 {
    color = $9  # Column 9 contains the PrimaryFurColor
    if (color == "") {
        color = "Other"
    }
    count[color]++
    total++
}

END {
    for (color in count) {
        percentage = (count[color] / total) * 100
        rounded_percentage = sprintf("%.1f", percentage)
        print color, count[color], rounded_percentage "%"
    }
}
