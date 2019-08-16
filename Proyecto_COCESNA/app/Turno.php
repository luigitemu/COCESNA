<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Turno extends Model
{
    protected $table = 'turnos';  //tabla por relacionar
    public $timestamps = false;
    protected $fillable = [
        'turno',
        'hora_inicio',
        'hora_fin',
    ];

    public function personal()
    {
        return $this->hasMany('App\Personal'); //relacion uno a muchos
    }
}
