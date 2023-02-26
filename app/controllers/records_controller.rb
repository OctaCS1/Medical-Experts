class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]

  # GET /records or /records.json
  def index
    @records = Record.all.order(created_at: :desc)
    if params[:search].present?
      patients = Patient.where("lower(firstname) LIKE ? OR lower(lastname) LIKE ? OR cnp LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").ids
      @records = @records.where(patient_id:patients)
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /records/1 or /records/1.json
  def show
  end

  # GET /records/new
  def new
    @patient = Patient.find(params[:patient])
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
    @patient = Patient.find(Record.find(params[:id]).patient.id)
  end

  # POST /records or /records.json
  def create
    @record = Record.new(record_params)
    @patient = Patient.find(@record.patient_id)

    respond_to do |format|
      if @record.save
        format.html { redirect_to record_url(@record), notice: "Fisa de observatie clinica a fost creata cu succes." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    @patient = Patient.find(@record.patient.id)
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: "Fisa de observatie clinica a fost modificata cu succes." }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url, notice: "Fisa de observatie clinica a fost stearsa cu succes." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_params
      params.require(:record).permit(
        :patient_id, :user_id, :judet_spital, :localitate_spital, :spital,
        :sectia, :internat_urgenta, :data_internarii, :ora_internarii, :data_externarii,
        :ora_externarii, :numar_zile_spitalizare, :numar_zile_concediu, :numar_talon_pensie,
        :diagnostic_de_trimitere, :diagnostic_la_internare, :diagnostic_la_72_ore,
        :diagnostic_externare_principal, :diagnostic_externare_boli,
        :interventie_tehnica, :interventie_boala, :interventie_data,
        :stare_la_externare, :decedat, :diagnostic_anatomo_patologic,
        :observatie_clinica, :observatie_data, :examinari_de_specialitate, :examene_cerute,
        :examen_oncologic_cavitate_bucala, :examen_oncologic_tegumente, :examen_oncologic_ganglionare,
        :examen_oncologic_san, :examen_oncologic_genital_feminin, :examen_oncologic_citologie_secretie,
        :examen_oncologic_prostata_rect, :examen_oncologic_alte
      )
    end
end
