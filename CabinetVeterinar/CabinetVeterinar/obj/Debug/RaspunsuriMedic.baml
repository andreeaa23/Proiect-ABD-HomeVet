   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	   &     CabinetVeterinar.RaspunsuriMedic   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	   -   5          ? Title$  RaspunsuriMedic??5   	   $	??500??6!   $	??800??6.    ? Icon$ /Images/Vetlogo.png??6:    ? WindowStartupLocation$ CenterScreen=?5	   
    ? 
ResizeMode$ NoResize=?6/   .??5
      ? ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   ?? -   5         ??Name$ 
btnImagine??5      $??/Images/Vetlogo.png??6%   $
??Left=?6B   $??64??6]   $??	10,10,0,0q?6i   $	??Top=?6|   $	??177??6?   $??2??6?   &   System.Windows.Controls.DataGrid  5   
   -   5        	  Name$	 gridRaspunsuri??5      $
??Left=?6+   
??????????#C0C0C0$	??274??6m   $??	28,79,0,0q?6z   $	??Top=?6?   $	??742??6?   
 ? 	Resources
 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5       ? ??$ Center=?6<   5      5         Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ IdIntrebare??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 6Q   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6:   ?? *id+6Q     5      $ 
Utilizator??6%   $	 200 6R    69   ?? *user+6R     5      $ 	Intrebare??6%   $	 400 6V    68   ?? *	intrebare+6V   5!      ?? 5"   
   -   5         ??Name$ 	btnCancel??5"      $
??Back??6$   ???#C0C0C0
???????$??15(?6Z   $
??Left=?6h   $??654,392,0,0q?6?   $	??Top=?6?   $	??116??6?   $??40??6?   6?   ?? 5#   
   -   5        $ btnRaspunde??5#      $??Raspunde??6&   ???#C0C0C0
???????$??15(?6`   $
??Left=?6n   $??513,392,0,0q?6?   $	??Top=?6?   $	??116??6?   $??40??6?   6?   ?? 5$   
   -   5         ??Name$ LblListaIntrebari??5$      $
??Bold"?6+   ???#C0C0C0$??Adauga raspuns??6S   $
??Left=?6l   $??
28,353,0,0q?6?   $	??Top=?6?   $	??186??6?   $??20(?6?   ?? 5%   
   -   5        $ LblListaProgramari??5%      $
??Bold"?6,   ???#C0C0C0$??SECTIUNE RASPUNSURI??6T   $
??Left=?6r   $??
289,10,0,0q?6?   $	??Top=?6?   $	??359??6?   $??30(?6?   ?? 5'   
   -   5         ??Name$ 
txtRaspuns??5'       ? Cursor$ Arrow??6&    ?? 
CaretBrush
 ?????$
??Left=?6H   $??45??6c   $??
28,392,0,0q?6o    ?? TextWrapping$
 Wrap=?6?   
??????????#C0C0C0$	??Top=?6?   $	??464??6?   5(      5)      