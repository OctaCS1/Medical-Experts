class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]

  def index
    @patients = Patient.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  # POST /patients or /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: "Pacientul a fost introdus cu succes." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Pacientul a fost modificat cu succes." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Pacientul a fost sters cu succes." }
    end
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(
        :lastname, :firstname, :data_nasterii, :varsta,
        :sex, :cnp, :serie_nr_buletin, :greutate,
        :inaltime, :ocupatie, :localitate, :judet,
        :adresa, :email, :grup_sangvin, :rh, :alergii
      )
    end
end
