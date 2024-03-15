import 'package:equatable/equatable.dart';

class SlugsByLocale extends Equatable {
  final String? itIt;
  final String? frFr;
  final String? esEs;
  final String? caEs;
  final String? frCh;
  final String? deCh;
  final String? enUs;
  final String? nlBe;
  final String? frBe;
  final String? svSe;
  final String? nlNl;
  final String? ptPt;
  final String? enAu;
  final String? deDe;
  final String? deAt;
  final String? enGb;

  const SlugsByLocale({
    this.itIt,
    this.frFr,
    this.esEs,
    this.caEs,
    this.frCh,
    this.deCh,
    this.enUs,
    this.nlBe,
    this.frBe,
    this.svSe,
    this.nlNl,
    this.ptPt,
    this.enAu,
    this.deDe,
    this.deAt,
    this.enGb,
  });

  factory SlugsByLocale.fromJson(Map<String, dynamic> json) => SlugsByLocale(
        itIt: json['it-IT'] as String?,
        frFr: json['fr-FR'] as String?,
        esEs: json['es-ES'] as String?,
        caEs: json['ca-ES'] as String?,
        frCh: json['fr-CH'] as String?,
        deCh: json['de-CH'] as String?,
        enUs: json['en-US'] as String?,
        nlBe: json['nl-BE'] as String?,
        frBe: json['fr-BE'] as String?,
        svSe: json['sv-SE'] as String?,
        nlNl: json['nl-NL'] as String?,
        ptPt: json['pt-PT'] as String?,
        enAu: json['en-AU'] as String?,
        deDe: json['de-DE'] as String?,
        deAt: json['de-AT'] as String?,
        enGb: json['en-GB'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'it-IT': itIt,
        'fr-FR': frFr,
        'es-ES': esEs,
        'ca-ES': caEs,
        'fr-CH': frCh,
        'de-CH': deCh,
        'en-US': enUs,
        'nl-BE': nlBe,
        'fr-BE': frBe,
        'sv-SE': svSe,
        'nl-NL': nlNl,
        'pt-PT': ptPt,
        'en-AU': enAu,
        'de-DE': deDe,
        'de-AT': deAt,
        'en-GB': enGb,
      };

  @override
  List<Object?> get props {
    return [
      itIt,
      frFr,
      esEs,
      caEs,
      frCh,
      deCh,
      enUs,
      nlBe,
      frBe,
      svSe,
      nlNl,
      ptPt,
      enAu,
      deDe,
      deAt,
      enGb,
    ];
  }
}
