   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	       CabinetVeterinar.Servicii   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	   -   5          ? Title$  Servicii??5   	   $	??610??6   $	??700??6'    ? WindowStartupLocation$ CenterScreen=?63    ? 
ResizeMode$ NoResize=?6X    ? Icon$ /Images/Vetlogo.png??5	   	   .??5
      ?  ? ColumnDefinitions 5   
   ?? 5      $	??85* ?6   ?? 5      ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   ?? -   5        	 ??Name$	 
btnImagine??5      $??/Images/Vetlogo.png??6$   $
??Left=?6A   $	??100??6\   $??	10,10,0,0q?6i   $	??Top=?6|   $	??301??6?   ?? 5   
   -   5        
 ??Name$
 lblDescriere??5      $??30(?6&   ???#C0C0C0$
??Bold"?6I   $!??Din dragoste pentru animale??6[   $
??Left=?6?   $??
10,110,0,0q?6?   $	??Top=?6?   $	??422??6?   ?? 5   
   -   5         ??Name$ boxOras??5      $
??Left=?6%   $??223,193,0,0q?6@   $	??Top=?6U   $	??196??6m   $??36??6y   5      ?? 5   
   -   5        $
 
lblCabinet??5      $??Selecteaza un oras??6$   $??20(?6A   ???#C0C0C0$
??Bold"?6d   $
??Left=?6v   $??
10,193,0,0q?6?   $	??Top=?6?   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ afisareDetalii??5         AutoGenerateColumns .  ???#C0C0C0
???????$
??Left=?6n   $	??245??6?   $??
49,263,0,0q?6?   $	??Top=?6?   $	??604??6?    J? RenderTransformOrigin$ 0.5,0.5&?6?    ? 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5       ? ??$ Center=?6<   5       5!      z?5"      V? 5#      .~?5$      ?? ?? 5%       ?? AngleX$ 0Q?6$   ?? 5&      T? 5'       T? X$ 0Q?6)   5(         Columns 5*      0  *System.Windows.Controls.DataGridTextColumn  5+      ,  &System.Windows.Controls.DataGridColumn   Header$ Adresa??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 6P   1  +System.Windows.Controls.DataGridBoundColumn   Binding 65   ?? *adresa+6P     5,      $ 	NrTelefon??6%   $	 200 6T    68   ?? *	nrTelef+6T     5-      $ Program??6%   $	 200 6R    66   ?? *	program+6R   50      ?? 53   
   -   5         ??Name$ 	btnCancel??53      $??Cancel??6$   ???#C0C0C0$
??Left=?6J   $??294,528,0,0q?6e   $	??Top=?6z   $??98??6?   $??15(?6?   $
??Bold"?6?   
???????$??29??6?   54      55      