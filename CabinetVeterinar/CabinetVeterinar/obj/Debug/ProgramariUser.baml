   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	   %    CabinetVeterinar.ProgramariUser   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	     ? Title$  ProgramariUser??5   	   $	??520??6    $	??800??6-    ? Icon$ /Images/Vetlogo.png??69    ? WindowStartupLocation$ CenterScreen=?5	   
   .??5
      ? ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   ?? -   5         ??Name$ 
btnImagine??5      $??/Images/Vetlogo.png??6%   $
??Left=?6B   $??64??6]   $??	10,10,0,0q?6i   $	??Top=?6|   $	??177??6?   $??2??6?   ?? 5   
   -   5         ??Name$ LblListaProgramari??5      $
??Bold"?6,   ???#C0C0C0$??PROGRAMARILE MELE??6T   $
??Left=?6p   $??
279,61,0,0q?6?   $	??Top=?6?   $	??342??6?   $??30(?6?   &   System.Windows.Controls.DataGrid  5   
   -   5        	  Name$	 gridProgramari??5      $
??Left=?6+   
??????????#C0C0C0$	??267??6m   $??
64,127,0,0q?6z   $	??Top=?6?   $	??674??6?   
   AutoGenerateColumns
 .    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Animal??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   ?? *animal+6P     5      $ Medic??6%   $	 240 6N    64   ?? *medic+6N     5      $
 Data??6%   $	 100 6L    63   ?? *data+6L     5      $	 Ora??6%   $	 170 6J    62   ?? *ora+6J    ? 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5        ? ??$ Center=?6<   5!      5"      5#      ?? 5$   
   -   5         ??Name$ 	btnCancel??5$      $
??Back??6$   ???#C0C0C0
???????$??15(?6Z   $
??Left=?6h   $??640,420,0,0q?6?   $	??Top=?6?   $	??116??6?   $??40??6?   6?   5&      5'      