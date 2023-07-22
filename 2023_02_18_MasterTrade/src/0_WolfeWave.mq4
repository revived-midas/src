#property indicator_chart_window

int gi_76 = 0;
int gi_80 = 0;
extern int Length = 14;
extern bool first_one = FALSE;
double g_ibuf_92[];
double gda_96[1000];
int g_bars_100 = 0;
int gi_104 = 0;
int g_bars_108 = 0;
int gi_unused_112 = 0;
int gi_116 = 0;

int init() {
   g_bars_100 = gi_76;
   if (g_bars_100 == 0 || g_bars_100 > Bars) g_bars_100 = Bars;
   ArrayResize(gda_96, g_bars_100);
   IndicatorBuffers(1);
   SetIndexBuffer(0, g_ibuf_92);
   SetIndexEmptyValue(0, 0);
   return (0);
}

void delete_obj() {
   string l_name_0 = "";
   for (int li_8 = ObjectsTotal() - 1; li_8 >= 0; li_8--) {
      l_name_0 = ObjectName(li_8);
      if (StringFind(l_name_0, "ww_line_", 0) == 0) ObjectDelete(l_name_0);
      else
         if (StringFind(l_name_0, "ww_text_", 0) == 0) ObjectDelete(l_name_0);
   }
}

void create_line(int ai_0, int ai_4, color a_color_8, double a_price_12, double a_price_20, int a_bool_28, int a_style_32) {
   string l_name_36 = "ww_line_" + gi_104;
   gi_104++;
   ObjectCreate(l_name_36, OBJ_TREND, 0, Time[ai_0], a_price_12, Time[ai_4], a_price_20);
   ObjectSet(l_name_36, OBJPROP_RAY, a_bool_28);
   ObjectSet(l_name_36, OBJPROP_COLOR, a_color_8);
   ObjectSet(l_name_36, OBJPROP_STYLE, a_style_32);
   ObjectSet(l_name_36, OBJPROP_BACK, TRUE);
   if (a_style_32 == STYLE_SOLID) {
      ObjectSet(l_name_36, OBJPROP_WIDTH, 2);
      return;
   }
   ObjectSet(l_name_36, OBJPROP_WIDTH, 1);
}

int deinit() {
   delete_obj();
   return (0);
}

void place_text(string a_text_0, int ai_8, double a_price_12, color a_color_20) {
   string l_name_24 = "ww_text_" + gi_116;
   gi_116++;
   if (ObjectFind(l_name_24) == -1) ObjectCreate(l_name_24, OBJ_TEXT, 0, Time[ai_8], a_price_12);
   ObjectSet(l_name_24, OBJPROP_TIME1, Time[ai_8]);
   ObjectSet(l_name_24, OBJPROP_PRICE1, a_price_12);
   ObjectSetText(l_name_24, a_text_0, 12, "Arial", a_color_20);
}

void draw_wolf_wave(double ada_0[], int aia_4[]) {
   for (int l_index_8 = 0; l_index_8 < 4; l_index_8++) {
      create_line(aia_4[l_index_8], aia_4[l_index_8 + 1], Blue, ada_0[l_index_8], ada_0[l_index_8 + 1], FALSE, STYLE_SOLID);
      place_text((l_index_8 + 1), aia_4[l_index_8] + 2, ada_0[l_index_8], DarkTurquoise);
      if (l_index_8 < 3) {
         place_text(DoubleToStr(MathAbs(ada_0[l_index_8 + 2] - (ada_0[l_index_8 + 1])) / MathAbs(ada_0[l_index_8] - (ada_0[l_index_8 + 1])), 3), (aia_4[l_index_8] + (aia_4[l_index_8 +
            2])) / 2, (ada_0[l_index_8] + (ada_0[l_index_8 + 2])) / 2.0, DarkTurquoise);
         create_line(aia_4[l_index_8], aia_4[l_index_8 + 2], Gray, ada_0[l_index_8], ada_0[l_index_8 + 2], FALSE, STYLE_DOT);
      }
   }
   create_line(aia_4[0], aia_4[2], Yellow, ada_0[0], ada_0[2], TRUE, STYLE_DOT);
   create_line(aia_4[1], aia_4[3], Yellow, ada_0[1], ada_0[3], TRUE, STYLE_DOT);
   create_line(aia_4[0], aia_4[3], Red, ada_0[0], ada_0[3], TRUE, STYLE_DASH);
}

int start() {
   int lia_0[6];
   double lda_4[6];
   double ld_28;
   double ld_36;
   if (g_bars_108 == Bars) return (0);
   delete_obj();
   g_bars_108 = Bars;
   int li_unused_12 = 0;
   int li_16 = 4;
   int li_20 = gi_80;
   int li_24 = -1;
   update_zz_buf(Length);
   while (li_20 < g_bars_100) {
      while (li_20 < g_bars_100 && li_16 >= 0) {
         if (gda_96[li_20] != 0.0) {
            lia_0[li_16] = li_20;
            lda_4[li_16] = gda_96[li_20];
            li_16--;
         }
         li_20++;
      }
      ld_28 = lda_4[1] + 1.27 * (lda_4[0] - lda_4[1]);
      ld_36 = lda_4[1] + 1.618 * (lda_4[0] - lda_4[1]);
      if ((ld_28 - lda_4[2]) * (ld_36 - lda_4[2]) <= 0.0 && (lda_4[0] - lda_4[2]) * (lda_4[4] - lda_4[2]) < 0.0) {
         if (lda_4[0] < lda_4[1] && lda_4[2] < lda_4[0] && (lda_4[0] - lda_4[3]) * (lda_4[1] - lda_4[3]) < 0.0) {
            draw_wolf_wave(lda_4, lia_0);
            li_24 = li_20 - 1;
         } else {
            if (lda_4[0] > lda_4[1] && lda_4[2] > lda_4[0] && (lda_4[0] - lda_4[3]) * (lda_4[1] - lda_4[3]) < 0.0) {
               draw_wolf_wave(lda_4, lia_0);
               li_24 = li_20 - 1;
            }
         }
      }
      for (int li_44 = 4; li_44 > 0; li_44--) {
         lia_0[li_44] = lia_0[li_44 - 1];
         lda_4[li_44] = lda_4[li_44 - 1];
      }
      li_16 = 0;
      Sleep(20);
      if (first_one && li_24 != -1) break;
   }
   ObjectsRedraw();
   return (0);
}

void update_zz_buf(int ai_0) {
   int l_str2int_32;
   double l_low_36;
   double l_high_44;
   double lda_84[10000][3];
   string ls_unused_88;
   int li_12 = 0;
   int li_8 = 0;
   int l_index_16 = 0;
   int li_96 = g_bars_100 - ai_0 - 1;
   double l_high_52 = High[li_96];
   double l_low_60 = Low[li_96];
   int li_24 = li_96;
   int li_28 = li_96;
   for (int li_100 = li_96; li_100 >= 0; li_100--) {
      gda_96[li_100] = 0;
      l_low_36 = 10000000;
      l_high_44 = -100000000;
      for (int li_20 = li_100 + ai_0; li_20 >= li_100 + 1; li_20--) {
         if (Low[li_20] < l_low_36) l_low_36 = Low[li_20];
         if (High[li_20] > l_high_44) l_high_44 = High[li_20];
      }
      if (Low[li_100] < l_low_36 && High[li_100] > l_high_44) {
         li_8 = 2;
         if (li_12 == 1) li_24 = li_100 + 1;
         if (li_12 == -1) li_28 = li_100 + 1;
      } else {
         if (Low[li_100] < l_low_36) li_8 = -1;
         if (High[li_100] > l_high_44) li_8 = 1;
      }
      if (li_8 != li_12 && li_12 != 0) {
         if (li_8 == 2) {
            li_8 = -li_12;
            l_high_52 = High[li_100];
            l_low_60 = Low[li_100];
         }
         l_index_16++;
         if (li_8 == 1) {
            lda_84[l_index_16][1] = li_28;
            lda_84[l_index_16][2] = l_low_60;
         }
         if (li_8 == -1) {
            lda_84[l_index_16][1] = li_24;
            lda_84[l_index_16][2] = l_high_52;
         }
         l_high_52 = High[li_100];
         l_low_60 = Low[li_100];
      }
      if (li_8 == 1) {
         if (High[li_100] >= l_high_52) {
            l_high_52 = High[li_100];
            li_24 = li_100;
         }
      } else {
         if (li_8 == -1) {
            if (Low[li_100] <= l_low_60) {
               l_low_60 = Low[li_100];
               li_28 = li_100;
            }
         }
      }
      li_12 = li_8;
   }
   for (li_20 = 1; li_20 <= l_index_16; li_20++) {
      l_str2int_32 = StrToInteger(DoubleToStr(lda_84[li_20][1], 0));
      gda_96[l_str2int_32] = lda_84[li_20][2];
   }
}