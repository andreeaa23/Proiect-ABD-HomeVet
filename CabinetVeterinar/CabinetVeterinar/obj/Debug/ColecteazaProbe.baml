   M S B A M L   `   `   `  ????K  GCabinetVeterinar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:CabinetVeterinarCabinetVeterinar  5   	   &     CabinetVeterinar.ColecteazaProbe   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:CabinetVeterinar     5   	     ? Title$  ColecteazaProbe??5   	   $	??550??6!   $	??900??6.    ? Icon$ /Images/Vetlogo.png??6;    ? WindowStartupLocation$ CenterScreen=?5	   
    ? 
ResizeMode$ NoResize=?6/   .??5
      ? ??5   
   ?? 5       ?? EndPoint$ 0.5,1&?6"    ?? 
StartPoint$ 0.5,0&?63   .??5      ?  ? Color$ Black??6    ? Offset$ 0Q?6-   ? 5      $ 	#FF772864??6   $ 1Q?61   5      .+?5   
   ?? -   5         ??Name$ 
btnImagine??5      $??/Images/Vetlogo.png??6%   $
??Left=?6B   $??64??6]   $??	10,10,0,0q?6i   $	??Top=?6|   $	??177??6?   $??2??6?   ?? 5   
   -   5        	 ??Name$	 LbllistaAsistenti??5      $
??Bold"?6+   ???#C0C0C0$??Selecteaza un asistent??6S   $
??Left=?6t   $??	39,96,0,0q?6?   $	??Top=?6?   $	??245??6?   $??20(?6?   ?? 5   
   -   5        
 ??Name$
 cbAsistenti??5      $
??Left=?6(   $??
54,154,0,0q?6C   $	??Top=?6W   $	??193??6o   $??34??6{   6?   ?? 5   
   -   5        $	 LbllistaLocatie??5      $
??Bold"?6)   ???#C0C0C0$??Selecteaza locatia??6Q   $
??Left=?6n   $??
39,207,0,0q?6?   $	??Top=?6?   $	??245??6?   $??20(?6?   ?? 5   
   -   5        $
 	cbLocatie??5      $
??Left=?6&   $??
54,265,0,0q?6A   $	??Top=?6U   $	??193??6m   $??34??6y   ?? 5   
   -   5        $	 LblListaProgramari??5      $
??Bold"?6,   ???#C0C0C0$??ACTUALIZARE PROGRAMARE??6T   $
??Left=?6u   $??
348,37,0,0q?6?   $	??Top=?6?   $	??438??6?   $??30(?6?   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ gridListaProgramari??5      $
??Left=?60   
??????????#C0C0C0$	??332??6r   $??304,113,0,0q?6   $	??Top=?6?   $	??561??6?    ? 	Resources 5      =  7System.Windows.Controls.Primitives.DataGridColumnHeader ?? 
TargetType ?? Property ?? Value??%?   '        ?? 5      "  6   .?5      ??  ? ??
 ?????63   ?? 5       ? ??$ SemiBold"?63   ?? 5       ? ??$ Center=?6<   5      5         Columns 5       0  *System.Windows.Controls.DataGridTextColumn  5!      ,  &System.Windows.Controls.DataGridColumn   Header$ ID??6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6H   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   ?? *id+6H     5"      $ Stapan??6%   $	 100 6T    65   ?? *
numeStapan+6T     5#      $ Pacient??6%   $	 100 6V    66   ?? *numePacient+6V     5$      $ Specie??6%   $	 140 6P    65   ?? *specie+6P     5%      $
 Data??6%   $ 70 6L    63   ?? *data+6L     5&      $	 Tip??6%   $ 10 6J    62   ?? *tip+6J   5)      ?? 5*   
   -   5         ??Name$ BtnModifica??5*      
??????????#C0C0C0$??Modifica??6M   $
??Left=?6`   $??
85,338,0,0q?6{   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   ?? 5+   
   -	   5        $ 	BtnCancel??5+      
??????????#C0C0C0$
??Back??6K   $
??Left=?6Z   $??728,467,0,0q?6u   $	??Top=?6?   $	??137??6?   $??30??6?   $??16(?6?   6?   5-      5.      