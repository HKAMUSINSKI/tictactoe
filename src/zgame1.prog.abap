*&---------------------------------------------------------------------*
*& Report zgame1
*&---------------------------------------------------------------------*
*& Hubert Kamusiński
*& created 01.04.2020
*&---------------------------------------------------------------------*
REPORT zgame1.

TABLES sscrfields. "table for button

Data:
f1,f2,f3,f4,f5,f6,f7,f8,f9,zf type c,
flag type c value 'X',
zbut(4) type c.


*SS view ********************************
SELECTION-SCREEN BEGIN OF BLOCK rad1 WITH FRAME TITLE text-001 NO INTERVALS.
SELECTION-SCREEN:
BEGIN OF LINE,
PUSHBUTTON 2(5) but1 USER-COMMAND cli1 MODIF ID sc1,
PUSHBUTTON 7(5) but2 USER-COMMAND cli2 MODIF ID sc2,
PUSHBUTTON 12(5) but3 USER-COMMAND cli3 MODIF ID sc3,
END OF LINE,
BEGIN OF LINE,
PUSHBUTTON 2(5) but4 USER-COMMAND cli4 MODIF ID sc4,
PUSHBUTTON 7(5) but5 USER-COMMAND cli5 MODIF ID sc5,
PUSHBUTTON 12(5) but6 USER-COMMAND cli6 MODIF ID sc6,
END OF LINE,
BEGIN OF LINE,
PUSHBUTTON 2(5) but7 USER-COMMAND cli7 MODIF ID sc7,
PUSHBUTTON 7(5) but8 USER-COMMAND cli8 MODIF ID sc8,
PUSHBUTTON 12(5) but9 USER-COMMAND cli9 MODIF ID sc9,
END OF LINE.
SELECTION-SCREEN END OF BLOCK rad1.

*SS view end********************************


*disabling process********************************
FORM box_disable USING ch.
  LOOP AT SCREEN.
    IF screen-group1 = ch.
      screen-input = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
ENDFORM. "box_disable

*changing flag process********************************
FORM flag_change changing flag.
if flag = 'X'.
        flag = '0'.
        else.
        flag = 'X'.
        ENDIF.
     endform. "flag_changed

*move process********************************
FORM zmove changing flag zbut zf.
zbut = flag.
perform flag_change changing flag.
zf = 1.

endform. "move


AT SELECTION-SCREEN OUTPUT.
IF f1 = 1.
    PERFORM box_disable USING 'SC1'.
  ENDIF.
  IF f2 = 1.
    PERFORM box_disable USING 'SC2'.
  ENDIF.
  IF f3 = 1.
    PERFORM box_disable USING 'SC3'.
  ENDIF.
  IF f4 = 1.
    PERFORM box_disable USING 'SC4'.
  ENDIF.
  IF f5 = 1.
    PERFORM box_disable USING 'SC5'.
  ENDIF.
  IF f6 = 1.
    PERFORM box_disable USING 'SC6'.
  ENDIF.
  IF f7 = 1.
    PERFORM box_disable USING 'SC7'.
  ENDIF.
  IF f8 = 1.
    PERFORM box_disable USING 'SC8'.
  ENDIF.
  IF f9 = 1.
    PERFORM box_disable USING 'SC9'.
  ENDIF.





AT SELECTION-SCREEN.
  CASE sscrfields.
    WHEN 'CLI1'.
    PERFORM zmove changing flag but1 f1.

    WHEN 'CLI2'.
    PERFORM zmove changing flag but2 f2.

    WHEN 'CLI3'.
    PERFORM zmove changing flag but3 f3.


    WHEN 'CLI4'.
    PERFORM zmove changing flag but4 f4.


    WHEN 'CLI5'.
    PERFORM zmove changing flag but5 f5.


    WHEN 'CLI6'.
    PERFORM zmove changing flag but6 f6.


    WHEN 'CLI7'.
    PERFORM zmove changing flag but7 f7.


    WHEN 'CLI8'.
    PERFORM zmove changing flag but8 f8.


    WHEN 'CLI9'.
    PERFORM zmove changing flag but9 f9.
  ENDCASE.
PERFORM win_1.



*win process********************************

form win_1.

if but1 = but5 and but1 = but9 and but1 NE ' '.
    perform win_2.
ENDIF.

if but3 = but5 and but3 = but7 and but3 NE ' '.
    perform win_2.
ENDIF.


if but1 = but2 and but1 = but3 and but1 NE ' '.
    perform win_2.
ENDIF.

if but4 = but5 and but4 = but6 and but4 NE ' '.
    perform win_2.
ENDIF.

if but7 = but8 and but7 = but9 and but7 NE ' '.
    perform win_2.
ENDIF.

if but1 = but4 and but1 = but7 and but1 NE ' '.
    perform win_2.
ENDIF.

if but2 = but5 and but2 = but8 and but2 NE ' '.
    perform win_2.
ENDIF.

if but3 = but6 and but3 = but9 and but3 NE ' '.
    perform win_2.
ENDIF.

if:
  but1 NE ' ' and
  but2 NE ' ' and
  but3 NE ' ' and
  but4 NE ' ' and
  but5 NE ' ' and
  but6 NE ' ' and
  but7 NE ' ' and
  but8 NE ' ' and
  but9 NE ' '.
   MESSAGE  'Brawo remis' type 'I'.
   perform reset.
  endif.


endform.


*win message********************************
form win_2.

if flag = 'X'.
  MESSAGE  'Brawo wygral gracz numer 2 czyli kolko' type 'I'.
  endif.
  if flag = '0'.
  MESSAGE  'Brawo wygral gracz numer 1 czyli krzyzyk' type 'I'.
 endif.
perform reset.
endform.



*reset process********************************
FORM reset.
  but1 = ' '.
  but2 = ' '.
  but3 = ' '.
  but4 = ' '.
  but5 = ' '.
  but6 = ' '.
  but7 = ' '.
  but8 = ' '.
  but9 = ' '.
  f1 = ' '.
  f2 =' '.
  f3 = ' '.
  f4 =' '.
  f5 = ' '.
  f6 =' '.
  f7 = ' '.
  f8 =' '.
  f9 = ' '.
* Message = ' '.
  ENDFORM. "reset
