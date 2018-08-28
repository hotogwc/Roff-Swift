# RoffSwift

[Roff](http://man7.org/linux/man-pages/man7/roff.7.html) generation library written in Swift. ( Inspired by  [roff-rs](https://github.com/killercup/roff-rs))

## Examples

```swift
let page = Roff("corrupt", section: 1)
            .appendSections("name", content: ["corrupt - modify files by randomly changing bits"])
            .appendSections("SYNOPSIS", content: [
                Printer.bold(input: "corrupt"),
                " ",
                "[", Printer.bold(input: "-n"), " ", Printer.italic(input: "BITS"), "]",
                " ",
                "[", Printer.bold(input: "--bits"), " ", Printer.italic(input: "BITS"), "]",
                " ",
                Printer.italic(input: "file"), "..."
                ])
            .appendSections("description", content: [Printer.bold(input: "corrupt"), " modifies files by toggling a randomly chosen bit."])
            .appendSections("options", content: [
                Printer.list(header: [Printer.bold(input: "-n"),
                                      ", ",
                                      Printer.bold(input: "--bits"),
                                      "=",
                                      Printer.italic(input: "BITS")],
                             content: ["Set the number of bits to modify. ", "Default is one bit."])
                ])
```

Which outputs:

```troff
.TH CORRUPT 1
.SH NAME
corrupt \- modify files by randomly changing bits
.SH SYNOPSIS
.B corrupt
[\fB\-n\fR \fIBITS\fR]
[\fB\-\-bits\fR \fIBITS\fR]
.IR file ...
.SH DESCRIPTION
.B corrupt
modifies files by toggling a randomly chosen bit.
.SH OPTIONS
.TP
.BR \-n ", " \-\-bits =\fIBITS\fR
Set the number of bits to modify.
Default is one bit.
```

Which will be shown by the `man(1)` command as:

```txt
CORRUPT(1)  General Commands Manual  CORRUPT(1)

NAME
       corrupt   -  modify  files  by  randomly
       changing bits

SYNOPSIS
       corrupt [-n BITS] [--bits BITS] file...

DESCRIPTION
       corrupt modifies  files  by  toggling  a
       randomly chosen bit.

OPTIONS
       -n, --bits=BITS
              Set the number of bits to modify.
              Default is one bit.

                                     CORRUPT(1)
```

## 





